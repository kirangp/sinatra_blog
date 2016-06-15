class AuthorsController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :"authors/new"
    else
      redirect "/posts"
    end
  end

  post '/signup' do
    @author = Author.new(params)

    if @author.save
      redirect '/login'
    else
      erb :"/authors/new"
    end
  end

  get '/authors/:id' do
    @author = Author.find_by(:id => params[:id])

    erb :"/authors/show"
  end


end