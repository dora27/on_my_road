require_relative '../components/result_routific.rb'
require_relative '../components/find_driver.rb'

class RequestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :show]

  def new
  end

  def create
    address = params[:address]

    if address.present?
      @request = Request.new(request_address: address)
      authorize @request

      @request.save
      redirect_to request_path(@request)
    else
      authorize Request.new # LOL PUNDIT
      flash[:alert] = "Veuillez fournir votre adresse de départ."
      redirect_to root_path
    end
  end

  def show
    # Resultats routific
    @request = Request.find(params[:id])
    authorize @request
    @address_search = @request.request_address
    @result = result_routific(@address_search)

    @driver_key = find_driver(@result)[:driver_key]
    @index = find_driver(@result)[:index]

    #Data a utiliser dans la show
    @town = split_address(@address_search)[1]
    @address_passenger = split_address(@address_search)[0]
    @charrues = "Dépendances de Persivien, Carhaix"

    @start_address = @result.vehicleRoutes[@driver_key].first.location_name
    @start_time = @result.vehicleRoutes[@driver_key].first.arrival_time

    @stop_time_start = @result.vehicleRoutes[@driver_key][@index].arrival_time
    @stop_time_end = @result.vehicleRoutes[@driver_key][@index].finish_time

    @end_address = @result.vehicleRoutes[@driver_key].last.location_name
    @end_time = @result.vehicleRoutes[@driver_key].last.arrival_time

    #Map
    @address_search_geo = Geocoder.search(@address_search)[0]
    @charrues_geo = Geocoder.search("Dépendances de Persivien, 29800 Carhaix")[0]
    @points = [@address_search_geo, @charrues_geo]

    @hash = Gmaps4rails.build_markers(@points) do |traject, marker|
      marker.lat traject.latitude
      marker.lng traject.longitude
    end

    @traject_id = Traject.find_by_starting_address(@start_address).id

    session[:request_id] = @request.id
  end

  private
  def find_driver(result)
    driver_key = ""
    res = {}
    i = 0
    result.vehicleRoutes.each do |key, arr|
     if arr.count > 2
      arr.each_with_index do |point, j|
        if point.location_id == "passenger"
          i = j
          driver_key = key
        end
      end
     end
    end
    res[:driver_key] = driver_key
    res[:index] = i
    return res
  end

  def split_address(address)
    address.split(',').map {|string| string.strip}
  end
  #def request_params
  #  params.require(:request).permit(:address)
  # end
end
