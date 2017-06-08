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
   	user_id = Too.find_user_id username.to_s
   	if user_id
   	else
   		Too.register_tooder username
			user_id = Too.find_user_id username
   	end
    rating = params[:rating]
    Too.save do_it_id,user_id,too_file  
    redirect "/"    
  end

  
    

    
  put '/:id'  do 
  	'put'      
   	id = params[:id].to_i
    username = params[:username]
    too_file = params[:tool_file]
    Post.update id,title,body
    redirect "/"
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