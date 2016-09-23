class AdventuresController < ApplicationController
  def index
  end
  def show
    redirect_to Adventure.find(params[:id]).root_path
  end
end