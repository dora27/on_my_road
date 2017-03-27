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
    unless @user.stop.nil?
      @user_stop = @user.stop
      @traject = Traject.find(@user_stop.traject_id)
      @address_stop = @user_stop.stop_address
      @address_stop_geo = Geocoder.search(@address_stop)[0]
      @address_stop_split = split_address(@address_stop)
    else
      @traject = @user.trajects[0]
      @stops = @traject.stops
      # Revoir le cas driver
    end
    authorize @traject

    @start_address = @traject.starting_address

    @stop_time = @user_stop.occurs_at
    @town = @address_stop_split[1]
    @address_passenger = @address_stop_split[0]

    # @end_time
    @charrues = "Dépendances de Persivien, Carhaix"
    @charrues_geo = Geocoder.search(@charrues)[0]
    @end_time = @user_stop.end_time

    @driver = User.find(@traject.user_id)

    # Map
    @trajects = [@traject, @charrues_geo, @address_stop_geo]
    @hash = Gmaps4rails.build_markers(@trajects) do |traject, marker|
      marker.lat traject.latitude
      marker.lng traject.longitude
    end
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

end
