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

    redirect ("/posts/#{post.slug}")
  end

  get '/posts/:slug' do
    @post = Post.find_by_slug(params[:slug])

    erb :'/posts/show'
  end

  get '/posts/:slug/edit' do
    @post = Post.find_by_slug(params[:slug])
    @tags = Tag.all
    if !logged_in?
      redirect "/login"
    else
      if post = current_user.posts.find_by_slug(params[:slug])
        erb :"/posts/edit"
      else
        redirect "/posts"
      end
    end
  end

  patch '/posts/:slug' do
    @post = Post.find_by_slug(params[:slug])
    @post.update(params[:post])

    redirect ("posts/#{@post.slug}")
  end

  delete '/posts/:slug/delete' do
    @post = Post.find_by_slug(params[:slug])

    if !logged_in?
      redirect "/login"
    else
      if post = current_user.posts.find_by_slug(params[:slug])
        @post.delete
        redirect to '/posts'
      else
        redirect "/posts"
      end
    end
  end

end

