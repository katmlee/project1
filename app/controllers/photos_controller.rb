class PhotosController < ApplicationController
  def index
    @photos = Photos.all
  end

  def new
  end

  def create
    req = Cloudinary::Uploader.upload( params[:file])
    @photo = Photo.create( name: params[:name], avatar: req["url"])
  end

  def show
  end
end
