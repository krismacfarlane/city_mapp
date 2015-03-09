class MapsController < ApplicationController
  before_action :load_city

  def index
    @maps = @city.maps
  end

  def new
    @map = Map.new(:city=>@city)
  end

  def create
    @map  = @city.maps.create(
      title: params[:map][:title],
      user:  current_user
    )
    redirect_to city_map_path(@city, @map)
  end

  def show
    @map  = Map.find(params[:id])
  end

  private

  def load_city
    @city = City.find(params[:city_id])
  end

end
