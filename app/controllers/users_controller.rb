class UsersController < ApplicationController 


  # create
   


    get '/users/new' do
        erb :"users/new"
      end
      
      post '/users' do
       
         user = User.new(params["user"])
         if user.save 
          #  session[:user_id]= user.id 
          redirect to "/users"
         else 
          @errors = user.errors.full_messages 
           erb :"/users/new"
        end 
       end 

      #  read

     get '/users' do 
        @users = User.all 
        erb :"/users/index"
    end 


       get "/users/:id" do 
        @user = User.find_by_id(params[:id])
        erb :"/users/show"
       end 
    
# update

       get "users/:id/edit" do 
        @user = User.find_by_id(params[:id])
        if @user == current_user
          erb :"/users/edit"
        else 
            redirect "/"
       end 
    end 

    patch '/authors/:id' do
        @user = User.find_by_id(params[:id])
    
        if @user.update(params[:user])
          redirect to "/users/#{@user.id}"
        else
          erb :"/users/edit"
        end
      end


      # I need to add a get route that updates I don't think I currently have one
# delete 
      delete '/users/:id' do
        @user = User.find(params[:id])
        if @user
          @user.destroy
        end
        redirect to "/users"
      end

end 