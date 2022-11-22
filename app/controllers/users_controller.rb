class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.all
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end