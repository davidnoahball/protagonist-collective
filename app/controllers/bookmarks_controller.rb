class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.where("user_id = ?", session[:user_id]).where("adventure_id = ?", params[:adventure_id])
    respond_to do |f|
      f.json {render json: @bookmarks}
    end
  end
end