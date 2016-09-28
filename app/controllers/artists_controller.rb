class ArtistsController < ApplicationController



  def index
  end

  def create
    @artist = Artist.create(artist_params(:name, :bio))
    redirect_to artist_path(@artist)
  end

  def new


  end

  def edit
    @artist = Artist.find(params[:id])
  end



  def show
    @artist = Artist.find(params[:id])
  end



  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params(:name, :bio))
    redirect_to artist_path(@artist)
  end



  private
   def artist_params(*arg)
     params.require(:artist).permit(*arg)
   end








end
