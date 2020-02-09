require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :mainpage
  end
  get '/users/new' do
    erb :"users/new"
  end
  post '/users' do
    user = User.new[params["user"]]
    if user.save 
      redirect to "/users"
    else 
      @errors = user.errors.full_messages
      erb :"/users/new"
    end 
   end 

   get "/users/:id" do 
    @user = User.find_by_id(params[:id])
    erb :"/users/show"
   end 


end
