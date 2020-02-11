class SessionsController < ApplicationController 

    get "/login" do 
erb :"sessions/new"
    end 

    post "/login" do 
        "hello welcome to log in you've just submitted your form "
    end 
end 