class StopsController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @traject = Traject.find(params[:traject_id])
    @stops = @traject.stops
    @remain_seats = @traject.seats
    @stops.each { |stop| @remain_seats -= 1 if stop.status == "Accepted"}

    @hash = google_map(@stops)

    @stops = policy_scope(Stop).order(created_at: :desc)
  end

  def create
    # Recuperer les data
    @user = current_user
    @traject = Traject.find(params[:traject_id])
    @stop_address = params[:stop_address]

    # Create
    @stop = Stop.new(stop_address: @stop_address)
    @stop.user = @user
    @stop.traject = @traject
    @stop.save
    authorize @stop
    flash[:notice] = "Votre demande a bien été transmise."
    redirect_to traject_path(@traject)
  end

  def show
  end

  def update
    stop = Stop.find(params[:id])
    stop.update(stop_params)
    authorize stop
    redirect_to traject_stops_path
  end

private

    def stop_params
      params.require(:stop).permit(:occurs_at, :address, :status)
    end

   def google_map(stops)
    stops = Stop.where.not(latitude: nil, longitude: nil)
    gmap_hash = Gmaps4rails.build_markers(stops) do |stop, marker|
      marker.lat stop.latitude
      marker.lng stop.longitude
    end
    return gmap_hash
  end
end
