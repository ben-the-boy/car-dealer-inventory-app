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
    erb :"vehicles/show"
  end

  get '/vehicles/:id/edit' do
    erb :"vehicles/edit"
  end

  patch '/vehicles/:id' do

  end

  delete '/vehicles/:id' do

  end
end
