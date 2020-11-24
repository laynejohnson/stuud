class BookingsController < ApplicationController
  before_action :set_client, only:[:create]

  def new
    @booking = Booking.new
    @lengths = [15, 30, 60]
  end


  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.client = @client
    if @booking.save
      redirect_to client_path(@client)
    else
      render :new
    end
  end

  def destroy
    raise
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to clients_path
  end

  private

  def set_client
    @client = Client.find(params[:booking][:client_id])
  end

  def booking_params
    params.require(:booking).permit(:description, :price, :length, :date, :payment_status, :status, :client)
  end
end
