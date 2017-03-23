class StopsController < ApplicationController
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
end

def show
end
end
