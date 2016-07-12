class DestinationsController < ApplicationController

  def index
    #how do we write all destinations for user id. Can an instance variable in a different contoller be called?
#    @destinations = Destination.all
    @user = User.find params[:user_id]
    @destinations = @user.destinations
  end

  def new
    @destination = Destination.new
  end

  def create
    destination = @current_user.destinations.create destination_params
    redirect_to user_destination_path(@current_user, destination)
  end

  def edit
    @destination = Destination.find params[:id]
  end

  def update
    destination = Destination.find params[:id]
    destination.update destiantion_params
    redirect_to user_destination_path(@current_user, destination)
  end

  def show
    @destination = Destination.find params[:id]
  end

  def destroy
    destination = Destination.find params[:id]
    destination.destroy
    redirect_to user_destinations_path(@current_user)
  end

  # have_been = []
  # def destination_coordinates
  #   @destinations.each do |destination|
  #     have_been.push("{ lat: #{destination.latitude }, lng: #{destination.longitude}}")
  #   end

  private
  def destination_params
    params.require(:destination).permit(:city, :country, :start_date, :end_date, :who, :purpose, :favorite_part, :photos, :map_link)
  end
end
