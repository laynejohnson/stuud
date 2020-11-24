class BookingsController < ApplicationController
  before_action :set_client, only:[:new, :create]

  def new
    @booking = Booking.new
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
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to calendar_path
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def booking_params
    params.require(:booking).permit(:description, :price, :length, :date, :payment_status, :status)
  end
end
