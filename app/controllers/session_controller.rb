class SessionController < ApplicationController
  
  get '/login' do
    if !logged_in?
      erb :"sessions/login"
    else
      redirect "/posts"
    end
  end

  post '/sessions' do
    login(params[:email], params[:password])

    redirect "/posts"
  end

  get '/logout' do
    logout!

    redirect "/posts"
  end
end