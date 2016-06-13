class SessionController < ApplicationController
  
  get '/login' do
    erb :"sessions/login"
  end

  post '/sessions' do
    login(params[:email])

    redirect "/posts"
  end

  get '/logout' do
    logout!

    redirect "/posts"
  end

  get '/signup' do
    @authors = Author.all

    erb :"sessions/signup"
  end
end