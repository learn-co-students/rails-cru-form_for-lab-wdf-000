class SongsController < ApplicationController

  def index

  end

  def create
    @song = Song.create(song_params(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end

  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def show
    @song = Song.find(params[:id])
    @genre = Genre.find(@song.genre_id)
    @artist = Artist.find(@song.artist_id)
  end

  private
  def song_params(*args)
    params.require(:song).permit(*args)
  end
end
