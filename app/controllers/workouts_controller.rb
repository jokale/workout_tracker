class WorkoutsController < ApplicationController

    get '/workouts/:id/edit' do 
        # binding.pry
        @workout = Workout.find_by(id: params[:id])
        erb :"/workouts/edit"
    end 




end 