class ToosController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  
  # sets the view directory correctly
  set :views, "views" 
  set :public_folder,"public"

  configure :development do
      register Sinatra::Reloader
  end

  
  third = 1
  do_its = ['/do-its/elephant.jpg','/do-its/sloth.jpg','/do-its/dragon.jpg']
  do_itms = ['Too of the week: On your marks... get set... Do it Too like mr Elephant' ,'Too of the week: Look at mr sloth. He likes to kick back and relax. Do it Too.' ,'Too of the week: Get ready for take off. Mr Dragon-fly id fired up to got.. Do it Too']
  $do_itm = do_itms[third]
  $do_it = do_its[third]
 


	get '/' do
		@toos = Too.all third		
		@home = true 
		erb :'toos/index'  
	end

  get '/new'  do    	
    erb :'toos/new' 

  end  
  
	get '/tooder' do
		@tooders = Too.all_tooders
		erb :'tooders/index'
	end

  get '/tooder/:id' do
  	id = params[:id].to_i 
  	@tooder = Too.find_tooder id		
    @toos = Too.tooders_toos id  
		erb :'tooders/show'
  end

  delete '/tooder/:id' do
  	Too.destroy_tooder params[:id].to_i
  	redirect '/tooder'
  end

	get '/:id' do
		id = params[:id].to_i 
		@too = Too.find_by_id id
    erb :'toos/show'  
	end

  post '/' do  
    # too_file = params[:too_file]
    # in future do it id will be from database or page. id = params[:id] for now = 1 
    # user specific posting(:ID represents do:it page)
    # post '/:id' do
    password = params[:password]
    username = params[:username]
    rating = params[:rating]
    @file = params[:tfile][:filename]   
    do_it_id = third   	# check if theyve posted before if not, add them as a tooder
   	unregistered = true
   	tooders = Too.all_tooders 
   	tooders.each {|tood| unregistered = false if username == tood.tooder}
    
   	if unregistered
   		Too.register_tooder username,password 	
   	end  	
		user_id = Too.find_user_id username
    # upload
    stamp = Time.new.to_f.to_s.gsub('.','')
    too_file = "uploads/#{stamp + @file }"
    Too.save do_it_id,user_id,too_file
    # @uploaded_too =Too.show_last_too
    File.open('public/uploads/'+stamp+ params[:tfile][:filename], "w") do |f|
    	f.write(params[:tfile][:tempfile].read)
	  end  
    redirect "/"    
  end
   
  put '/:id'  do 
  	'put'      
   	id = params[:id].to_i
   	@too = Too.find_by_id id 
    username = params[:username]
    too_file = params[:tool_file]

    if @too.tooder == username
	    @too.update too_file,id
	    redirect "/"
  	else
	  	@message = 'Incorrect tooder name Tooders may only edit their own toos'
	  	erb :'toos/edit'
 	 	end
  end
    
  delete '/:id'  do
    id = params[:id].to_i
    too = Too.find_by_id id
    tooder = Too.find_tooder too.user_id 
    
    if tooder.password == params[:password]
      Too.destroy id
    end
    redirect "/"    
  end
    
  get '/:id/edit'  do
  	'edit'
  	@tooedit = true
    id = params[:id].to_i
    @too= Too.find_by_id id
    erb :'toos/edit'
  end    
  get '/:id/rate-edit'  do
    id = params[:id].to_i
    @too= Too.find_by_id id
    
  end

  put '/:id/rate'do    
    id = params[:id].to_i
  	too = Too.find_by_id id
  	if too.rating 
  		rating = too.rating
  		rating = rating.split(',')
  		a = rating[0].to_i + params[:rating].to_i
  		b = rating[1].to_i + 5 		
  	else 		
  		a = params[:rating].to_i
  		b = 5
  	end
  	rated = "#{a},#{b}" 	
  	Too.rate rated,id
  	redirect "/"+id.to_s
	end


end