class UsersController < ApplicationController 


  # create user 
   


    get '/users/new' do
        erb :"users/new"
      end
      
      post '/users' do
      
       user = User.new(params["user"])
       workout = Workout.create(params["workout"])
       user.workouts << workout
        #  user = User.new(params[":id"])
        if user.save 
        session[:user_id]= user.id 

          redirect to "/users"
         else 
          @errors = user.errors.full_messages
           erb :"/users/new"
        end 
       end 

   
# index action
     get '/users' do 
        @users = User.all 
        erb :"/users/index"
    end 

   #  read
       get "/users/:id" do 
        @user = User.find_by_id(params[:id])
        erb :"/users/show"
       end 
    
# update

        get 'users/:id/edit' do 
          #  @user = User.find_by(id: params[:id])
        #  binding.pry
          #  @user == current_user
           erb :"/users/edit"
        #  else 
            #  redirect "/"
      #  end 
    end 

    patch '/workouts/1' do
      erb :"/workouts/edit"
    end
     patch '/users/:id' do
        # @user = User.find_by_id(params[:id])
    
        # if @user.update(params[:user])
          # redirect to "/users/#{@user.id}"
        # else
           erb :"/users/edit"
        # end
       end


      
# delete 
      delete '/users/:id' do
        @user = User.find(params[:id])
        if @user
          @user.destroy
        end
        redirect to "/users"
      end

end 