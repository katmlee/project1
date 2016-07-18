class DestinationsController < ApplicationController
  before_action :authorize_user, :except => [:index, :show]

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
    # @destination = @current_user.destinations.create destination_params
    # req = Cloudinary::Uploader.upload(params[:file])
    # @user = @current_user
    # @desination.image = req["url"]
    redirect_to user_destination_path(@current_user, destination)
  end

  def edit
    @destination = Destination.find params[:id]
  end

  def update
    @destination = Destination.find params[:id]
    # @destination.photos.destroy_all unless params[:destination_photos].empty?
    params[:destination_photos].any? && params[:destination_photos].each do |photo|
      req = Cloudinary::Uploader.upload(photo)
      p = Photo.create(:image => req["url"])
      @destination.photos << p
      # Or maybe @destination.photos.create(:image => req["url"])
    end
    @destination.update destination_params
    @user = @current_user
    redirect_to user_destination_path(@current_user, @destination)
  end

  def show
    @destination = Destination.find params[:id]
  end

  def destroy
    destination = Destination.find params[:id]
    destination.destroy
    redirect_to user_destinations_path(@current_user)
  end

  private
  def destination_params
    params.require(:destination).permit(:city, :country, :start_date, :trip_synopsis, :must_do, :must_see, :must_eat, :end_date, :who, :purpose, :favorite_part, :map_link, :destination_photos)
  end
end
