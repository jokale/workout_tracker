require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, SecureRandom.hex 
  end

  get "/" do
    erb :mainpage
  end

 get '/signup' do 
  erb :loggedpage
 end 
  
   post '/signup' do
    if user.save 
     redirect to '/loggedpage'
    else 
       redirect to '/users/new'
    end
  end  

def logged_in?
!!current_user
end 

def current_user

  User.find_by(id: session[:author_id])
end 


end
