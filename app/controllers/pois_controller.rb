class PoisController < ApplicationController
  def show
    @poi = Poi.find(params[:id])
  end
end
