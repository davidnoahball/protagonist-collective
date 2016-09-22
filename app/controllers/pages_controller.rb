class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
    session[:parent_id] = @page.id
  end
  def new
    @page = Page.new(adventure_id: params[:adventure_id], parent_id: session[:parent_id], user_id: session[:user_id])
  end
  def create
    filtered = pages_params
    filtered.delete_if {|k, v|
      v.blank?
    }
    @page = Page.new(filtered)
    if filtered[:end] && (filtered[:choice1] || filtered[:choice2])
      @page.errors.add(:end, :not_valid, message: "can't have an ending and choices!")
    end
    if !@page.errors.any? && @page.save
      #Page.find(@page.parent_id) ignore for now
    else
      return render :new
    end
    redirect_to adventure_page_path(@page)
  end

  private
  def pages_params
    params.require(:page).permit(:adventure_id, :parent_id, :user_id, :body, :end, :choice1, :choice2)
  end
end