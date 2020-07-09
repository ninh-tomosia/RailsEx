class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to users_path
    else
      @user = User.new
    end
  end

  def create
    user = User.find_by(email: permit_params[:email])
    if user && user.authenticate(permit_params[:password])
        log_in user
        redirect_to home_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    if logged_in?
      session[:user_id] = nil
      redirect_to login_path
    end
  end

  private

  def permit_params
      params.require(:sessions).permit(:email, :password)
  end
  
end
