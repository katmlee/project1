class UsersController < ApplicationController
  before_action :authorise_user, :only => [:index, :show]
  before_action :check_for_user, :only => [:edit, :update]

  def index
    @users = User.all
  end

  def login
   @user = User.koala(request.env['omniauth.auth']['credentials'])
   facebook_id = @user["id"]
   @current_user = User.find_or_create_by(:facebook_id => facebook_id)
   @current_user.first_name = @user["first_name"]
   @current_user.last_name = @user["last_name"]
   @current_user.email = @user["email"]
   @current_user.password_digest = "efielkwj"
   @current_user.save
   session[:user_id] = @current_user.id
   redirect_to user_destinations_path(@current_user)

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_destinations_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = @current_user
  end

  def update
    req = Cloudinary::Uploader.upload(params[:file])
    @user = @current_user
    @user.image = req["url"]
    if @user.update(user_params)
      redirect_to user_destinations_path(@user)
    else
      render :edit
    end
  end

  def show
    @user = User.find params[:id]
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to user_destinations_path(user)
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :email, :birthdate, :current_city, :current_city, :fav_destination, :about_me, :password_confirmation, :image)
  end

  def check_for_user
    redirect_to new_user_path unless @current_user.present?
  end
end
