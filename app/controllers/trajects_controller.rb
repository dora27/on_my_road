class TrajectsController < ApplicationController
  def show
    @the_traject = Traject.find(params[:id])
    @charrues = Geocoder.search("Dépendances de Persivien, 29800 Carhaix")[0]


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
