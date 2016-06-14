class PostsController < ApplicationController

  get '/posts' do
    @posts = Post.all

    erb :"/posts/index"
  end

  get '/posts/new' do
    if !logged_in?
      redirect "/login"
    else
      erb :"/posts/new"
    end
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])

    erb :'/posts/show'
  end

  get '/posts/:id/edit' do
    if !logged_in?
      redirect "/login"
    else
      post = Post.find(params[:id])

      if post.author_id == current_user.id
        "An edit post form #{current_user.id} is editing #{post.id}"
      else
        redirect "/posts"
      end
      # erb :"/posts/edit"
    end
  end

end