class AuthorsController < ApplicationController

  get '/signup' do

    erb :"authors/new"
  end

  post '/authors' do
    @author = Author.new(params)

    if @author.save
      redirect '/login'
    else
      erb :"/authors/new"
    end
  end


end