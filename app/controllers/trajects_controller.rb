class TrajectsController < ApplicationController
  def show

    @traject = Traject.find(params[:id])
    @hash = Gmaps4rails.build_markers(@traject) do |traject, marker|
      marker.lat traject.latitude
      marker.lng traject.longitude
    end
    authorize @traject


    @start_time =
    @start_address = @traject.starting_address

    @stop_time =
    @stop_address =

    @end_time =
    @charrues = "Dépendances de Persivien, Carhaix"

  end

  def edit
  end

  def update
  end

end
