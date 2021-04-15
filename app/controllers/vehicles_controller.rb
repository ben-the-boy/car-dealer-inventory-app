class VehiclesController < ApplicationController
  get '/vehicles' do
    @vehicles = Vehicle.all
    @users = User.all
    erb :"vehicles/index"
  end

  get '/vehicles/new' do
    erb :"vehicles/new"
  end

  post '/vehicles' do
    vehicle = current_user.vehicles.create(params[:vehicle])
    redirect "/vehicles/#{vehicle.id}"
  end

  get '/vehicles/:id' do
    @vehicle = Vehicle.find(params[:id])
    erb :"vehicles/show"
  end

  get '/vehicles/:id/edit' do
    @vehicle = Vehicle.find(params[:id])
    erb :"vehicles/edit"
  end

  patch '/vehicles/:id' do
    @vehicle = Vehicle.find(params[:id])
    @vehicle.update(params[:vehicle])
    redirect "/vehicles/#{@vehicle.id}"
  end

  delete '/vehicles/:id/delete' do
    @vehicle = Vehicle.find(params[:id])
    @vehicle.delete
    redirect '/vehicles'
  end
end
