class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to admin_users_path
    else
      render edit
    end
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:image, :name, :intro)
  end
end
