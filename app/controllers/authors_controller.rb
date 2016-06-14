class AuthorsController < ApplicationController

  get '/signup' do

    erb :"authors/new"
  end

  post '/authors' do
    
    if !Author.find_by(:email => params[:email]) 
      @author = Author.new(params)
      @author.save
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