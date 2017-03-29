class StopsController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @traject = Traject.find(params[:traject_id])
    @remain_seats = @traject.seats
    @stops = policy_scope(Stop).where(traject_id: @traject.id)
    @stops.each { |stop| @remain_seats -= 1 if stop.status == "Accepted"}
    @hash = google_map(@stops)
  end

  def create
    # Recuperer les data
    @user = current_user
    @traject = Traject.find(params[:traject_id])
    @stop_address = params[:stop_address]
    @stop_time = params[:stop_time]

    # Create
    @stop = Stop.new(stop_address: @stop_address, occurs_at: @stop_time, end_time: params[:end_time])
    @stop.user = @user
    @stop.traject = @traject
    @stop.save
    authorize @stop
    flash[:notice] = "Votre demande a bien été transmise."

    #StopMailer.validation(@stop).deliver_now
    redirect_to user_path(@user)

  end

  def update
    stop = Stop.find(params[:id])
    if params[:status] == 'Accepted'
      stop.update(status: params[:status])
    elsif params[:status] == 'Refused'
      stop.update(status: params[:status])
    end
    authorize stop
    # redirect_to traject_stops_path
  end

private

  def stop_params
      params.require(:stop).permit(:occurs_at, :address, :status)
  end

  def google_map(stops)
    stops = Stop.where.not(latitude: nil, longitude: nil)
    gmap_hash = Gmaps4rails.build_markers(stops) do |stop,  marker|
      marker.lat stop.latitude
      marker.lng stop.longitude
      marker.json({ :id => stop.id })
      marker.infowindow "#{stop.user.first_name} #{stop.user.last_name}"

    end
    return gmap_hash
  end


end
