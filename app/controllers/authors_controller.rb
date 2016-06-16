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
      # @author.errors
      render :"/authors/new"
    end
  end

  get '/authors/:slug' do
    @author = Author.find_by_slug(params[:slug])

    erb :"/authors/show"
  end


end