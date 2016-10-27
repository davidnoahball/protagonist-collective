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
    @page = Page.new(pages_params)
    if !(session[:user_id])
      @page.errors.add(:body, :not_valid, message: ": You must be logged in to write a new page!")
    end
    par = @page.adventure.pages.find(@page.parent_id)
    if (par.child1_id != nil && pages_params[:which_child] == "1") || (par.child2_id != nil && pages_params[:which_child] == "2")
      return redirect_to "/"
    end
    if !@page.errors.any? && @page.save
      if pages_params[:which_child] == "1"
        par.child1_id = @page.id
        par.save!(:validate => false)
      elsif pages_params[:which_child] == "2"
        par.child2_id = @page.id
        par.save!(:validate => false)
      end
    else
      return puts "Failed!"
    end

    redirect_to @page.path
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

    @page = Page.find(params[:id])
    @page.update(pages_params)
    if @page.save
      redirect_to @page.path
    else
      render :edit
    end
  end

  private
  def pages_params
    params.require(:page).permit(:adventure_id, :parent_id, :user_id, :body, :end, :choice1, :choice2, :which_child)
  end
end