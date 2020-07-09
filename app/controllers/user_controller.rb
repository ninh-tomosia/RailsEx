class UserController < ApplicationController
    def index
        @users = User.all
    end
    def new
        @user = User.new
    end
    def create
        @user = User.new(get_params)
        if @user.save
            redirect_to users_path
        else
            render :new
        end
    end
    def show
        @user = User.find(params[:id])
    end
    def edit
        @user = User.find(params[:id])
    end
    def update
        @user = User.find(params[:id])
        if @user.update(get_params)
            redirect_to users_path
        else
            render :edit
        end
    end
    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            redirect_to users_path
        end
    end
    private
    def get_params
        params.require(:user).permit(:name, :email, :password, :phone, :address)
    end
end