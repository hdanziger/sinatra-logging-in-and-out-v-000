require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find(params[:username])
    if @user.password !=nil && @user.password == (params[:password])
    session[:user_id] = @user.user_id
    redirect to '/account'
    end
    erb :error
  end

  get '/account' do
    if @current_user = User.find(session[:user_id])
      @current_user
      erb :account
    else
      redirect '/error'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
