class TrajectsController < ApplicationController
  def show

    @traject = Traject.find(params[:id])
    @hash = Gmaps4rails.build_markers(@traject) do |traject, marker|
      marker.lat traject.latitude
      marker.lng traject.longitude
    end
    authorize @traject

  end

  def edit
  end

  def update
  end

end
