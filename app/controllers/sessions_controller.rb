class SessionsController < ApplicationController
  def create
    if params[:user]
      @user = User.find_by(name: params[:user][:name])
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
    else
      @user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = @user.id
    end
    redirect_to "/"
  end
  def destroy
    session.delete :user_id
    redirect_to "/"
  end
end