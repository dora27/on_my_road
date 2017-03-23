require_relative '../components/result_routific.rb'
require_relative '../components/find_driver.rb'

class RequestsController < ApplicationController
  def new
  end

  def create
    @request = Request.new(request_address: params[:address])
    @request.save
    authorize @request
    redirect_to request_path(@request)
  end

  def show
    @request = Request.find(params[:id])
    authorize @request
    @address_passenger = @request.request_address
    @result = result_routific(@address_passenger)

    @driver_key = find_driver(@result)[:driver_key]
    @index = find_driver(@result)[:index]

    @start_address = @result.vehicleRoutes[@driver_key].first.location_name
    @start_time = @result.vehicleRoutes[@driver_key].first.arrival_time

    @post_time_start = @result.vehicleRoutes[@driver_key][@index].arrival_time
    @post_time_end = @result.vehicleRoutes[@driver_key][@index].finish_time

    @end_address = @result.vehicleRoutes[@driver_key].last.location_name
    @end_time = @result.vehicleRoutes[@driver_key].last.arrival_time

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
  #def request_params
  #  params.require(:request).permit(:address)
  # end
end
