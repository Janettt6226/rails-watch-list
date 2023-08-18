class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  def index
    @lists = List.all
    @movies = Movie.all
  end

  def show; end

  def new
    @list = List.new
    @movie = Movie.new
    @bookmark = Bookmark.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :movie_id)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
