class SessionsController < ApplicationController 
  # storing my sessions

    get "/login" do 
       erb :"sessions/new"
    end 

    post "/login" do 
    #  binding.pry 

      @user = User.find_by(email: params[:user][:email])
         if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
        # redirect to "/users/:id"
        redirect to "/users/#{@user.id}"
        else 
          redirect to '/'
     end 
    end 

    post '/logout' do
        session.clear
        redirect to '/'
      end
end 
