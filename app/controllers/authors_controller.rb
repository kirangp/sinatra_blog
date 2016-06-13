class AuthorsController < ApplicationController

  get '/signup' do
    @authors = Author.all

    erb :"authors/new"
  end

  post '/authors' do
    @author = Author.new(:name => params[:name])
    @author.email = params[:email]
    @author.password = params[:password]

    if @user.save
      redirect "/login"
    else
      erb :"/authors/new"
    end
  end


end