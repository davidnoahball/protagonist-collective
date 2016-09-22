class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
    session[:parent_id] = @page.id
  end
  def new
    @page = Page.new(adventure_id: params[:adventure_id], parent_id: session[:parent_id])
  end
  def create
  end
end