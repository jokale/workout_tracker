class UsersController < ApplicationController 


  # create user 
   


    get '/users/new' do
        erb :"users/new"
      end
      
      post '/users' do 
       user = User.new(params["user"])
      #  workout = Workout.create(params["workout"])
      #  user.workouts << workout
       
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
get '/users/:id/edit' do 
  erb :"/users/edit"
end 

post '/users/1/edit' do
  erb :"/users/edit"
end
      
# update is not physically working 

patch '/users/:id/edit' do
  # user.save 
  redirect to "/users"
end

# post '/users/:id/edit' do
        #  "Hello World"
        #  erb :"/users/update"
      #  end
        # get 'users/:id/edit' do 
         
          #  erb :"/users/edit"
       
    # end 

    # patch '/workouts/1' do
      # erb :"/user/edit"
    # end


     patch '/users/:id' do
      
           erb :"/users/edit"
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