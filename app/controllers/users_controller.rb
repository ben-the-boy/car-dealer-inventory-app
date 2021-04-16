class UsersController < ApplicationController
  get '/signup' do
    if !logged_in?
      erb :"users/signup", :layout => false
    else
      redirect '/vehicles'
    end
  end

  post '/signup' do
    @user = User.create(username: params[:username], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "Welcome #{current_user.username}!"
      redirect '/vehicles'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :"users/login", :layout => false
    else
      redirect '/vehicles'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:message] = "Welcome #{current_user.username}!"
      redirect '/vehicles'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      flash[:message] = "Successfully logged out."
      redirect '/login'
    else
      redirect '/login'
    end 
  end
end
