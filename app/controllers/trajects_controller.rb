class TrajectsController < ApplicationController
  def show

    # Data
    @traject = Traject.find(params[:id])
    authorize @traject

    @all_stops = @traject.stops
    @user = current_user
    @user_stop = Stop.find_by_user_id(current_user.id)
    @address_stop = split_address(@user_stop.stop_address)
    @end_time = @user_stop.end_time


    # @start_time
    @start_address = @traject.starting_address

    @stop_time = @user_stop.occurs_at
    @town = @address_stop[1]
    @address_passenger = @address_stop[0]

    # @end_time
    @charrues = "Dépendances de Persivien, Carhaix"

    @driver = User.find(@traject.user_id)

    # Map
    @hash = Gmaps4rails.build_markers(@traject) do |traject, marker|
      marker.lat traject.latitude
      marker.lng traject.longitude
    end

  end

  def edit
  end

  def update
  end

  private
  def split_address(address)
    address.split(',').map {|string| string.strip}
  end

end
