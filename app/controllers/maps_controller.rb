class MapsController < ApplicationController

  def index

  end

  def new
    @map = Map.new
  end

end
