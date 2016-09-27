class SongsController < ApplicationController

  def show
    @song = Song.find_by(id: params[:id])
  end

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    # binding.pry
    @song = Song.new(params.require(:song).permit(:name, :artist_id, :genre_id))
    @song.save
    redirect_to song_path(@song)
  end

  def edit
    @song = Song.find_by(id: params[:id])
  end

  def update
    # binding.pry
    @song = Song.find_by(id: params[:id])
    @song.update(params.require(:song).permit(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end

end
