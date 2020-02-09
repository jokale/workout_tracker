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
    "Hello World"
  end

end
