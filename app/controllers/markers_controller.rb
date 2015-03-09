class MarkersController < ApplicationController

  def index
    @markers = Marker.all

    render json: @markers
  end

  def show
    render json: @marker
  end

  def create
    binding.pry
    @map = Map.find(params[:id])
    @map.markers << Marker.new(lat: params[:lat].to_f, long: params[:long].to_f, popup_content: params[:popup_content])
  end

end
