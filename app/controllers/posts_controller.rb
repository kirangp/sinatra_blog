class PostsController < ApplicationController
  use Rack::Flash

  get '/posts' do
    @posts = Post.all

    erb :"/posts/index"
  end

  get '/posts/new' do
    @tags = Tag.all
    if !logged_in?
      @author = Author.new
      flash[:message] = "Please login to create a new post"
      erb :"/sessions/login"
    else
      @post = Post.new
      erb :"/posts/new"
    end
  end

  post '/posts' do
    @post = Post.new(params[:post])
    @post.author = current_user
    if @post.save
      redirect "/posts/#{@post.slug}"
    else
      @tags = Tag.all
      erb :"/posts/new"
    end
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

