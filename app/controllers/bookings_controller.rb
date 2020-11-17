class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.equipment = Equipment.find(params[:equipment_id])
    @booking.accepted = "pending"

    @booking.save

    redirect_to profile_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
