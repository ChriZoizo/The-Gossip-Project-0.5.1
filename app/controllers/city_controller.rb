class CityController < ApplicationController
  def show
    @city = City.find(params[:id])
    @users = User.where(city: @city)
   @gossips = Gossip.where(user: @users)
  end
end
