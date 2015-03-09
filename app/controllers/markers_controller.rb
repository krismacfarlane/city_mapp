class MarkersController < ApplicationController

  def index
    @markers = Marker.all
  end

  def show
  end

  def create
    @map = Map.find(params[:map_id])
    @map.markers << Marker.new(lat: params[:lat].to_f, long: params[:long].to_f, popup_content: params[:popup_content])
  end

end
