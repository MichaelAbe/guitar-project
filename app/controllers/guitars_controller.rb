class GuitarsController < ApplicationController

    get '/guitars/new' do
        erb :'guitars/new'
      end

    post '/guitars' do
        binding.pry
        guitar = Guitar.new(params[:guitar])
        if guitar.save
            redirect 'guitars'
        else
            redirect 'guitars/new'
        end
    end
end