class Guest::SessionsController < ApplicationController
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
        permit_params[:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to root_path
    else
      render 'new',  :flash => { :error => 'Invalid email/password combination' }
    end
  end

  def destroy
    if logged_in?
      forget(current_user)
      session.delete(:user_id)
      @current_user = nil
      redirect_to login_path
    end
  end

  private

  def permit_params
      params.require(:sessions).permit(:email, :password, :remember_me)
  end
  
end