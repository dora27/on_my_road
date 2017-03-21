class TrajectsController < ApplicationController
  def show
    @traject = Traject.find(params[:id])

    @hash = Gmaps4rails.build_markers(@trajects) do |traject, marker|
      marker.lat traject.latitude
      marker.lng traject.longitude
  end

  def edit
  end

  def update
  end

end
