class ToosController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  
  # sets the view directory correctly
  set :views, "views" 
  set :public_folder,"public"

  configure :development do
      register Sinatra::Reloader
  end


	get '/' do
		@toos = Too.all
		@title = "what??" 
		erb :'toos/index'  
	end

  get '/new'  do    	
    erb :'toos/new'    
  end  

  get '/:id' do
   id = params[:id].to_i
   @too = Too.find_by_id id    
   erb :'toos/show'   
  end
    
  post '/' do  

    too_file = params[:tool_file]
  # in future do it id will be from database or page. id = params[:id] for now = 1 
 # user specific posting(:ID represents do:it page)
  # post '/:id' do   
    do_it_id = 1
    username = params[:username]
   	toos = Too.all
   	# check if theyve posted before if not, add them as a tooder
   	unregistered = true
   	toos.each {|todo| unregistered = false if username == todo.tooder}
   	if unregistered
   		Too.register_tooder username  	
   	end
		user_id = Too.find_user_id username
    rating = params[:rating]
    Too.save do_it_id,user_id,too_file  
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
  	'delete'
    # id = params[:id].to_i
    # Post.destroy id
    # redirect "/"    
  end
    
  get '/:id/edit'  do
  	'edit'
    id = params[:id].to_i
    @too= Too.find_by_id id
    erb :'toos/edit'
  end
  get '/:id/rating/edit'do
	end


end