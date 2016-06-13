class PostsController < ApplicationController

  get '/posts' do
    "You are logged in as #{session[:email]}"
  end

  get '/posts/new' do
    if !session[:email].present?
      redirect "/login"
    else
      erb :"/posts/new"
    end
  end

  get '/logout' do
    session.clear
  end

end