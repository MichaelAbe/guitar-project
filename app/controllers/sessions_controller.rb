class SessionsController < ApplicationController
    get '/signup' do
        
    erb :'sessions/signup'
    end

    post '/signup' do 
        user = User.new(params[:user])
        if user.save
            session[:user_id] = user.id
            redirect "/guitars"
        else
            redirect "/signup"
        binding.pry
        end
    end

    get '/logout' do
        "Hello World"
    end
end