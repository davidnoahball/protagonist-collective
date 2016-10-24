class AdventuresController < ApplicationController
  def index
    @adventures = Adventure.all
  end
  def show
    redirect_to Adventure.find(params[:id]).root_path
  end
  def new
    if User.find(session[:user_id]).usertype == 0
      redirect_to "/"
    end
    @adventure = Adventure.new
  end
  def create
    filtered = adventure_params
    filtered[:critical_size] = filtered[:critical_size].to_i
    a = Adventure.new(filtered)
    a.save(:validate => false)
    redirect_to "/adventures"
  end

  private
  def adventure_params
    params.require(:adventure).permit(:title, :critical_size, pages_attributes: [:adventure_id, :body, :choice1, :choice2])
  end
end