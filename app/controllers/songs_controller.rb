class SongsController < ActionController::Base

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
    @genre = Genre.find_by_id(@song.genre_id)
    @artist = Artist.find_by_id(@song.artist_id)
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(params.require(:song).permit(:name, :artist_id, :genre_id))
    @song.save
    redirect_to song_path(@song)
  end

  def update
    @song = Song.find(params[:id])
    @artist = Artist.find_or_create_by(@song["artist_id"])
    @genre = Genre.find_or_create_by(@song["genre_id"])
    if !@artist.songs.include?(@song)
      @artist.songs << @song
    end

    if @genre.songs.include?(@song)
      @genre.songs << @song
    end
    @song.update(params.require(:song).permit(:name, :artist_id, :genre_id))
    redirect_to genre_path(@song)
  end

  def edit
    @song = Song.find(params[:id])
    @genre = Genre.find_by_id(@song.genre_id)
    @artist = Artist.find_by_id(@song.artist_id)
  end

  private

  def post_params(*args)
    params.require(:song).permit(*args)
  end

end
