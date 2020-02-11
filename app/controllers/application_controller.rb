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

 
#helper methods 
helper do 

def logged_in?
!!current_user
end 

def current_user

  User.find_by(id: session[:author_id])
end 








  # get '/users/new' do
  #   erb :"users/new"
  # end
  
  # post '/users' do
  #   user = User.new[params["user"]]
  #   if user.save 
  #     redirect to "/users"
  #   else 
  #     @errors = user.errors.full_messages
  #     erb :"/users/new"
  #   end 
  #  end 

  #  get "/users/:id" do 
  #   @user = User.find_by_id(params[:id])
  #   erb :"/users/show"
  #  end 

  #  get "users/:id/edit" do 
  #   @user = User.find_by_id(params[:id])
  #   erb :"/edit"
  #  end 


end
