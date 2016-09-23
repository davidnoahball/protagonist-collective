class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
    session[:parent_id] = @page.id
  end
  def new
    session[:option] = params[:option]
    @page = Page.new(adventure_id: params[:adventure_id], parent_id: session[:parent_id], user_id: session[:user_id])
  end
  def create
    filtered = pages_params
    filtered.delete_if {|k, v|
      v.blank?
    }
    @page = Page.new(filtered)
    if filtered[:end] && (filtered[:choice1] || filtered[:choice2])
      @page.errors.add(:end, :not_valid, message: ": You can't have an ending and choices!")
    end
    if !(filtered[:end] || filtered[:choice1] || filtered[:choice2])
      @page.errors.add(:end, :not_valid, message: ": You need either an ending or choices!")
    end
    par = Adventure.find(filtered[:adventure_id]).pages.find(filtered[:parent_id])
    if (par.child1_id != nil && session[:option] == "1") || (par.child2_id != nil && session[:option] == "2")
      return redirect_to "/"
    end
    if !@page.errors.any? && @page.save
      if session[:option] == "1"
        par.child1_id = @page.id
        par.save!
      elsif session[:option] == "2"
        par.child2_id = @page.id
        par.save!
      end
    else
      return render :new
    end
    redirect_to "/adventures/#{@page.adventure_id}/pages/#{@page.id}"
  end

  private
  def pages_params
    params.require(:page).permit(:adventure_id, :parent_id, :user_id, :body, :end, :choice1, :choice2)
  end
end