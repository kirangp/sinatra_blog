class PostsController < ApplicationController

  get '/posts' do
    @posts = Post.all

    erb :"/posts/index"
  end

  get '/posts/new' do
    @tags = Tag.all
    if !logged_in?
      redirect "/login"
    else
      erb :"/posts/new"
    end
  end

  post '/posts' do
    post = Post.new(params[:post])
    post.author = current_user
    post.save

    redirect ("/posts/#{post.id}")
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])

    erb :'/posts/show'
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(:id => params[:id])
    @tags = Tag.all
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

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(params[:post])

    redirect ("posts/#{@post.id}")
  end

end