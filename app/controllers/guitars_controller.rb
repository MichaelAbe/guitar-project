class GuitarsController < ApplicationController

    get '/guitars/new' do
        erb :'guitars/new'
      end



end