class SessionController < ApplicationController
  def new
  end
  def login
   @user = User.koala(request.env['omniauth.auth']['credentials'])
  end
  def create
    user = User.find_by :email => params[:email]
    if user.present? && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to user_destinations_path(user)
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
