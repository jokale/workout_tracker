class WorkoutsController < ApplicationController

    get '/workouts/new' do
        erb :"workouts/new"
      end

      post '/workouts/new' do
        erb :"workouts/new"
      end

      get '/workouts' do
        @workouts = Workout.all 
        erb :"/workouts/index"
      end
  
      post '/workouts' do
        "Hello World"
        @workout = Workout.new(params["workout"])
        if workout.save 
            session[:workout_id]= workout.id 
            redirect  to "/workouts"
        else
            erb :"/workouts/new"
        end 
      end


    get '/workouts/:id/edit' do 
       
        @workout = Workout.find_by(id: params[:id])
        erb :"/workouts/edit"
    end 




end 