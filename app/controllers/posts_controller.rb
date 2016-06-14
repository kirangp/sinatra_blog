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
      if post = current_user.posts.find_by(:id => params[:id])
        erb :"/posts/edit"
      else
        redirect "/posts"
      end
    end
  end

end