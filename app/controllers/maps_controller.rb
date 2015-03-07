class MapsController < ApplicationController

  def index
    @maps = Map.where(city_id: params[:city_id])
    @city = @maps.first.city.name
  end

  def new
    @map = Map.new
  end

  def show
    @map = Map.find(params[:id])
    @city = @map.city.name
  end

end
