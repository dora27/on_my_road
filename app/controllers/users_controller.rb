class UsersController < ApplicationController
  def new
    @user= User.new
  end

  def create
    @user = User.new
    @user.save
  end

  def show
    @user = find_user

    #show/traject
     #info sur le depart


    #info sur l arrivee
    @charrues = "Dépendances de Persivien, Carhaix"
    @charrues_geo = Geocoder.search(@charrues)[0]

    #if Passenger
    if @user.trajects.empty?
      #infos sur le stop
      @user_stop = @user.stop
      @traject = Traject.find(@user_stop.traject_id)
      authorize @traject

      @address_stop = @user_stop.stop_address
      @address_stop_geo = Geocoder.search(@address_stop)[0]
      @address_stop_split = split_address(@address_stop)
      @stop_time = @user_stop.occurs_at
      @town = @address_stop_split[1]
      @address_passenger = @address_stop_split[0]


      @end_time = @user_stop.end_time
      @driver = User.find(@traject.user_id)

      # Map
      @trajects = [@traject, @charrues_geo, @address_stop_geo]
      @hash = Gmaps4rails.build_markers(@trajects) do |traject, marker|
        marker.lat traject.latitude
        marker.lng traject.longitude
      end

    #Driver
    else @user.trajects
      @traject = @user.trajects[0]
      @remain_seats = @traject.seats
      @stops = @traject.stops
      @stops.each { |stop| @remain_seats -= 1 if stop.status == "Accepted"}
      @hash = google_map(@stops)
    end
    @start_address = @traject.starting_address
  end

  def edit
    find_user
  end

  def update
    find_user
    @user.update(user_params)
    redirect_to user_path(current_user, tab: "profile")
  end

  def profile
    find_user
  end

  private
  def find_user
    @user = User.find(current_user.id)
    authorize @user
    return @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :photo)
  end

  def split_address(address)
    address.split(',').map {|string| string.strip}
  end
  def google_map(stops)
    stops = Stop.where.not(latitude: nil, longitude: nil)
    gmap_hash = Gmaps4rails.build_markers(stops) do |stop, marker|
      marker.lat stop.latitude
      marker.lng stop.longitude
      marker.json({ :id => stop.id })
      marker.infowindow "#{stop.user.first_name} #{stop.user.last_name}"

    end
    return gmap_hash
  end

end
