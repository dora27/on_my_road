class StopsController < ApplicationController

def create
  # Recuperer les data
  @user = current_user
  @traject = Traject.find(params[:traject_id])
  @stop_address = params[:stop_address]

  # Create
  @stop = Stop.new(stop_params)
  @stop.stop_address = @stop_address
  @stop.user = @user
  @stop.traject = @traject
  @stop.save
  authorize @stop
  flash[:notice] = "Votre demande a bien été transmise."
  # redirect_to root_path
end

  def show
    @user = User.find(current_user.id)
    @traject = Traject.find(params[:traject_id])
    @stops = @traject.stops
    @remain_seats = @traject.seats
    @stops.each { |stop| @remain_seats -= 1 if stop.status == "Accepted"}

    @stops = Stop.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@stops) do |stop, marker|
      marker.lat stop.latitude
      marker.lng stop.longitude
    end

    authorize @stops
  end

  def update
    stop = Stop.find(params[:id])
    stop.update(stop_params)
    authorize stop
    redirect_to traject_stop_path
  end

private

    def stop_params
      params.require(:stop).permit(:occurs_at, :address, :status)
    end
  end
