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
  @user = User.find_by_id(params[:id])
  if @user == current_user 
  erb :"/users/edit"
  else 
    redirect to "/" 
  end
end 

  # browser asked me to add this even though I shouldn't need it 
   set :method_override, true 
  

  patch '/users/:id/edit' do
    #  binding.pry 
    @user = User.find_by_id(params[:id])
      if @user.update(params[:user])
    redirect to "/users/#{@user.id}"
      else 
        erb :"/users/edit"
    end
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