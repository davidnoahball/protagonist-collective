class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      @user = User.find_by(name: params[:user][:name])
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
    else
      return render :new
    end
    
    redirect_to "/"
  end
  def new
  end
  def login
  end
  def show
    @user = User.find(session[:user_id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end