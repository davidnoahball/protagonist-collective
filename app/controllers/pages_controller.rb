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
    if (@page.end && !(@page.adventure.critical? || @page.user.ends_available?(@page.adventure)) && User.find(session[:user_id]).usertype == 0)
      @page.errors.add(:end, :not_valid, message: ": You can't write an ending unless you have written a choices page or the adventure is critical!")
    end
    if !(session[:user_id])
      @page.errors.add(:body, :not_valid, message: ": You must be logged in to write a new page!")
    end
    par = Adventure.find(filtered[:adventure_id]).pages.find(filtered[:parent_id])
    if (par.child1_id != nil && session[:option] == "1") || (par.child2_id != nil && session[:option] == "2")
      return redirect_to "/"
    end
    if !@page.errors.any? && @page.save
      if session[:option] == "1"
        par.child1_id = @page.id
        par.save!(:validate => false)
      elsif session[:option] == "2"
        par.child2_id = @page.id
        par.save!(:validate => false)
      end
    else
      return render :new
    end
    redirect_to "/adventures/#{@page.adventure_id}/pages/#{@page.id}"
  end
  def edit
    if User.find(session[:user_id]).usertype == 0
      redirect_to "/"
    end
    @page = Page.find(params[:id])
  end
  def update
    if User.find(session[:user_id]).usertype == 0
      redirect_to "/"
    end
    filtered = pages_params
    filtered.delete_if {|k, v|
      v.blank?
    }
    @page = Page.find(params[:id])
    @page.update(filtered)
    if @page.save
      redirect_to @page.path
    else
      render :edit
    end
  end

  private
  def pages_params
    params.require(:page).permit(:adventure_id, :parent_id, :user_id, :body, :end, :choice1, :choice2)
  end
end