class SessionController < ApplicationController
  
  get '/login' do
    if !logged_in?
      @author = Author.new
      erb :"sessions/login"
    else
      redirect "/posts"
    end
  end

  post '/login' do
    if login(params[:email], params[:password])
      redirect "/posts"
    else
      @author.errors
      erb :"sessions/login"
    end
  end

  get '/logout' do
    logout!

    redirect "/posts"
  end
end