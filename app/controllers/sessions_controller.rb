class SessionsController < ApplicationController
  skip_before_action :running

  def new
    if logged_in?
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    user = User.find_by(email: permit_params[:email])
    if user && user.authenticate(permit_params[:password])
        log_in user
        redirect_to root_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    if logged_in?
      session.delete(:user_id)
      @current_user = nil
      redirect_to login_path
    end
  end

  private

  def permit_params
      params.require(:sessions).permit(:email, :password)
  end
  
end
