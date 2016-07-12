class UsersController < ApplicationController
  before_action :authorise_user, :only => [:index]
  before_action :check_for_user, :only => [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.save
      session[:id] = @user.id
      redirect_to user_destinations_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user
    if @user.update user_params
    redirect_to user_destinations_path(user)
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

def authorise_user
  redirect_to root_path if @current_user.present? && @current_user.admin?
end

def check_for_user
  redirect_to new_user_path unless @current_user.present?
end
end
