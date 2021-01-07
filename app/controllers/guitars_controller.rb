class GuitarsController < ApplicationController
    get '/guitars' do
        @guitars = Guitar.all
        erb :'guitars/index'
    end

    get '/guitars/new' do
        erb :'guitars/new'
    end
    
    get '/guitars/:id/edit' do
        @guitar = Guitar.find_by_id(params[:id])
        erb :'guitars/edit'
    end
    
    get '/guitars/:id' do
        @guitar = Guitar.find_by_id(params[:id])
        #binding.pry
        erb :'guitars/show'
    end

    post '/guitars' do
        #binding.pry
        guitar = Guitar.new(params[:guitar])
        if guitar.save
            redirect 'guitars'
        else
            redirect 'guitars/new'
        end
    end

    patch '/guitars/:id' do
        #binding.pry
        @guitar = Guitar.find_by_id(params[:id])

    if @guitar.update(params[:guitar])
      redirect "/guitars/#{@guitar.id}"
    else
      redirect "/guitars/#{@guitar.id}/edit"
    end
    end

    # patch '/guitars/:id/' do
    #     "Hello World"
    #   end

    # patch '/guitars/:id/' do
    #     #binding.pry
    #     @guitar = Guitar.find_by_id(params[:id])
    #     if @guitar.update(params[:guitar])
    #         redirect 'guitars/#{@guitar.id}'
    #     else
    #         redirect 'guitars/#{@guitar.id}/edit'
    #     end
    # end
end