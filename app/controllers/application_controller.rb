require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "workingoutisgreat"
  end

  get "/" do
    erb :mainpage
  end

  # signup route

  #  get '/signup' do 
  #   erb :loggedpage
  #  end 
  
   post '/signup' do
      
      user = User.new(params[:user])
       if user.save
       
     redirect to "/loggedpage"
     else 
         redirect to "/error"
      end 
  end  
 

  helpers do  


def logged_in?
!!current_user
end 

def current_user

  User.find_by(id: session[:user_id])
end 

def redirect_if_not_logged_in
  if !logged_in?
    redirect '/login'
  end 
end 

end 


end 