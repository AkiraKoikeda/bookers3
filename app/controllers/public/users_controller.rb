class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(@user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :body, :image, :intro)
  end
end
