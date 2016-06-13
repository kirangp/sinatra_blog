class PostsController < ApplicationController

  get '/posts' do
    "You are logged in as #{session[:email]}"

    erb :"/posts/index"
  end

end