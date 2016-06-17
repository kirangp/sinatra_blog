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
    @author = Author.find_by(:email => params[:email])

    if @author && @author.authenticate(params[:password])
      session[:email] = @author.email
      redirect "/posts"
    else
      erb :"/sessions/login", locals: {message: "Invalid email or password! Please try again."}
    end
  end

  get '/logout' do
    logout!

    redirect "/posts"
  end
end