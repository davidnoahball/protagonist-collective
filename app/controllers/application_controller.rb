class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def angular
    render 'spa_things/test'
  end
end