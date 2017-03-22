require_relative '../components/result_routific.rb'

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
    address_passenger = @request.request_address
    @result = result_routific(address_passenger)
  end

  # private
  # def request_params
  #   params.require(:request).permit(:address)
  # end
end
