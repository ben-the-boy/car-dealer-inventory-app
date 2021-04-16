class UsersController < ApplicationController
  get '/signup' do
    if !logged_in?
      erb :"users/signup", :layout => false
    else
      redirect '/vehicles'
    end
  end

  post '/signup' do
    @user = User.create(username: params[:username], password: params[:password], dealership: params[:dealership])
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "Welcome #{current_user.username}!"
      redirect '/home'
    else
      flash[:message] = "Please complete all fields."
      redirect '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :"users/login", :layout => false
    else
      redirect '/home'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:message] = "Welcome #{current_user.username}!"
      redirect '/home'
    else
      flash[:message] = "Invalid Username or Password."
      redirect '/login'
    end
  end

  get '/home' do
    if logged_in?
      erb :"/users/vehicles"
    else
      flash[:message] = "Please login to continue."
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
