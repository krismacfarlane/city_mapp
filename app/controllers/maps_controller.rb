class MapsController < ApplicationController

  def index
    @maps = Map.where(city_id: params[:city_id])
    @city = @maps.first.city.name
  end

  def new
    @city = City.find(params[:city_id])
    @map = Map.new(:city=>@city)
  end

  def create
    @city = params[:city_id]
    @map = Map.new
    @map.title = params[:map][:title]
    @map.city_id = @city
    @map.user_id = session[:user_id]
    @map.save
    redirect_to city_map_path(@city, @map)
  end

  def show
    @city = City.find(params[:city_id])
    @map = Map.find(params[:id])
  end

  private

  def map_params
    params.require(:map).permit(:title)
  end

end
