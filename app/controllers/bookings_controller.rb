class BookingsController < ApplicationController
before_action :set_booking, only: [:destroy, :update]

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.equipment = Equipment.find(params[:equipment_id])
    @booking.accepted = "pending"

    @booking.save
    redirect_to profile_path
  end

  def update
    @booking.status = "pending"
    @booking.save!
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    # I think we'll want this to redirect to the profile page in the future. Just a placeholder for now.
    redirect_to profile_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
