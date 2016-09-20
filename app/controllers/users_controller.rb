class UsersController < ApplicationController
  def create
    user = User.new(user_params).save
    redirect_to "/"
  end
  def new
  end
  def login
  end
  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end