class PhotosController < ApplicationController
  def index
    @photos = Photos.all
  end

  def new
  end

  def create

  end

  def show
    # @destination = params[:photo_id]
    # @photos = @destination.photos

  end
end
