class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # @list = List.find(params[:list_id])
      if @bookmark.destroy
        redirect_to lists_path, status: :see_other
      else
        puts 'destruction failed'
      end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
