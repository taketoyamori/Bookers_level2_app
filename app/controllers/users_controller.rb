class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
     if @user.id != current_user.id
			 redirect_to user_path(@current_user.id)
		 end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user), notice: 'You have updated user successfully.'
    else
       render :edit
    end
  end

private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end


end
