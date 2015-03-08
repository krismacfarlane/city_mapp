class MarkersController < ApplicationController

  def index
  end

  def create
    @map = Map.find(params[:id])
    binding.pry
    @map.markers << Marker.new(lat: params[:lat].to_f, long: params[:long].to_f, popup_content: params[:popup_content])
  end

end
