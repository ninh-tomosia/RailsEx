class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: permit_params[:email])
    if user && user.authenticate(permit_params[:password])
        log_in user
        redirect_to users_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end

  private

  def permit_params
      params.require(:sessions).permit(:email, :password)
  end
  
end
