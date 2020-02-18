class WorkoutsController < ApplicationController

    get '/workouts/new' do
        erb :"workouts/new"
      end


  
    get '/workouts/:id/edit' do 
       
        @workout = Workout.find_by(id: params[:id])
        erb :"/workouts/edit"
    end 




end 