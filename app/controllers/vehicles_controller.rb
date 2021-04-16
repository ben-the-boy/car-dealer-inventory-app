class VehiclesController < ApplicationController
  get '/vehicles' do
    @vehicles = Vehicle.all
    @users = User.all
    erb :"vehicles/index"
  end

  get '/vehicles/new' do
    if logged_in?
      erb :"vehicles/new", :layout => false
    else
      flash[:message] = "Please login to continue."
      redirect '/login'
    end
  end

  post '/vehicles' do
    vehicle = current_user.vehicles.create(params[:vehicle])
    if vehicle.save
      flash[:message] = "Vehicle saved!"
      redirect "/home"
    else
      flash[:message] = "Please complete all fields."
      redirect '/vehicles/new'
    end
  end

  get '/vehicles/:id' do
    if Vehicle.ids.include?(params[:id].to_i)
      @vehicle = Vehicle.find(params[:id])
      erb :"vehicles/show"
    else
      flash[:message] = "Vehicle does not exist."
      redirect '/vehicles'
    end
  end

  get '/vehicles/:id/edit' do
    if logged_in? && Vehicle.ids.include?(params[:id].to_i)
      @vehicle = Vehicle.find(params[:id])
      if @vehicle.user_id == current_user.id
        erb :"vehicles/edit", :layout => false
      else
        flash[:message] = "Vehicle is not in your inventory."
        redirect "/vehicles/#{@vehicle.id}"
      end
    else
      flash[:message] = "Please login to continue."
      redirect '/login'
    end
  end

  patch '/vehicles/:id' do
    @vehicle = Vehicle.find(params[:id])
    @vehicle.update(params[:vehicle])
    flash[:message] = "Vehicle updated!"
    redirect "/vehicles/#{@vehicle.id}"
  end

  delete '/vehicles/:id/delete' do
    if logged_in? && Vehicle.ids.include?(params[:id].to_i)
      @vehicle = Vehicle.find(params[:id])
      if current_user.vehicle_ids.include?(@vehicle.id)
        @vehicle.delete
        flash[:message] = "Vehicle removed!"
        redirect '/home'
      else
        flash[:message] = "Vehicle is not in your inventory."
        redirect "/vehicles/#{@vehicle.id}"
      end
    else
      flash[:message] = "Please login to continue."
      redirect '/login'
    end
  end
end
