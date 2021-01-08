class GuitarsController < ApplicationController
    get '/guitars' do
        redirect_if_not_logged_in
        @guitars = current_user.guitars
        @guitar = Guitar.find_by_id(session[:guitar_id])
        erb :'guitars/index'
    end

    get '/guitars/new' do
        redirect_if_not_logged_in
        erb :'guitars/new'
    end
    
    get '/guitars/:id/edit' do
        redirect_if_not_logged_in
        @guitar = Guitar.find_by_id(params[:id])
        
        redirect '/guitars' unless @guitar
        erb :'guitars/edit'
    end
    
    get '/guitars/:id' do
        redirect_if_not_logged_in
        @guitar = Guitar.find_by_id(params[:id])
        session[:guitar_id] = @guitar.id if @guitar
        redirect '/guitars' unless @guitar
        #binding.pry
        erb :'guitars/show'
    end


    post '/guitars' do
        guitar = current_user.guitars.build(params[:guitar])
        #binding.pry
        if guitar.save
            redirect 'guitars'
        else
            redirect 'guitars/new'
        end
    end

    patch '/guitars/:id' do
        #binding.pry
        @guitar = Guitar.find_by_id(params[:id])
        redirect '/guitars' unless @guitar
        if @guitar.update(params[:guitar])
            redirect "/guitars/#{@guitar.id}"
        else
            redirect "/guitars/#{@guitar.id}/edit"
        end
    end

    delete '/guitars/:id' do
        @guitar = Guitar.find_by_id(params[:id])
        if @guitar
            @guitar.destroy
            redirect '/guitars'
        end
      end


    def redirect_if_not_owner
        redirect '/guitars' unless @guitar.owner == current_user
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