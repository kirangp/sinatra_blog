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

  end

end
