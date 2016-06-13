require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "authentication_sinatra"
  end

  get "/" do
    "Hello World"
  end

  helpers do

    def logged_in?
      !!session[:email]
    end

    def logout!
      session.clear
    end

    def login(email, password)
      author = Author.find_by(:email => email)
      
      if author && author.authenticate(password)
        session[:email] = author.email
      else
        redirect "/login"
      end
    end

  end

end
