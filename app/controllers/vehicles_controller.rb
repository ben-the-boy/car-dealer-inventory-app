class VehiclesController < ApplicationController
  get '/vehicles' do
    @vehicles = Vehicle.all
    @users = User.all
    erb :"vehicles/index"
  end

  get '/vehicles/new' do
    if logged_in?
      erb :"vehicles/new"
    else
      redirect '/login'
    end
  end

  post '/vehicles' do
    vehicle = current_user.vehicles.create(params[:vehicle])
    if vehicle.save
      redirect "/vehicles/#{vehicle.id}"
    else
      redirect '/vehicles/new'
    end 
  end

  get '/vehicles/:id' do
    if Vehicle.ids.include?(params[:id].to_i)
      @vehicle = Vehicle.find(params[:id])
      erb :"vehicles/show"
    else
      redirect '/vehicles'
    end
  end

  get '/vehicles/:id/edit' do
    if logged_in? && Vehicle.ids.include?(params[:id].to_i)
      @vehicle = Vehicle.find(params[:id])
      if @vehicle.user_id == current_user.id
        erb :"vehicles/edit"
      else
        redirect "/vehicles/#{@vehicle.id}"
      end
    else
      redirect '/login'
    end
  end

  patch '/vehicles/:id' do
    @vehicle = Vehicle.find(params[:id])
    @vehicle.update(params[:vehicle])
    redirect "/vehicles/#{@vehicle.id}"
  end

  delete '/vehicles/:id/delete' do
    if logged_in? && Vehicle.ids.include?(params[:id].to_i)
      @vehicle = Vehicle.find(params[:id])
      if current_user.vehicle_ids.include?(@vehicle.id)
        @vehicle.delete
        redirect '/vehicles'
      else
        redirect "/vehicles/#{@vehicle.id}"
      end
    else
      redirect '/login'
    end
  end
end
