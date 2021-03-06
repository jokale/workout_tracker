class WorkoutsController < ApplicationController

    get '/workouts/new' do
        erb :"workouts/new"
      end

      post '/workouts/new' do
        erb :"workouts/new"
      end

      get '/workouts' do
        redirect_if_not_logged_in
         @workouts = Workout.all 
        erb :"/workouts/index"
      end
  
     

      post '/workouts' do
        workout = Workout.new(params["workout"])
        if workout.save 
            session[:workout_id]= workout.id 
            redirect  to "/workouts"
        else
            erb :"/workouts/new"
        end 
      end

 get "/workouts/:id" do 
        @workout = Workout.find_by_id(params[:id])
        erb :"/workouts/show"
       end

    get '/workouts/:id/edit' do 
       
        @workout = Workout.find_by(id: params[:id])
        erb :"/workouts/edit"
    end 

    patch '/workouts/:id/edit' do 
      @workout = Workout.find_by_id(params[:id])
      if @workout.update(params[:workout])
    redirect to "/workouts/#{@workout.id}"
      else 
        erb :"/workouts/edit"
      end
    end 

      delete '/workouts/:id' do
        @workout = Workout.find(params[:id])
        if @workout 
          @workout.destroy
        end
        redirect to "/users"
      end


end 