class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
    session[:parent_id] = @page.id
  end
  def new
    @page = Page.new(adventure_id: params[:adventure_id], parent_id: session[:parent_id], user_id: session[:user_id])
  end
  def create
    raise pages_params.inspect
  end

  private
  def pages_params
    params.require(:page).permit(:adventure_id, :parent_id, :user_id, :body, :end, :chocie1, :choice2)
  end
end