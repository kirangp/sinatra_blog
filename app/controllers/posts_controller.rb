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

  get '/posts/:id/edit' do
    if !session[:email].present?
      redirect "/login"
    else
      erb :"/posts/edit"
    end
  end

end