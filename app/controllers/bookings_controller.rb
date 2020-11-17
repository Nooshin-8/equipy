class BookingsController < ApplicationController
  before_action :set_booking, only: [:des troy]
  
  def destroy
    @booking.destroy
    # I think we'll want this to redirect to the profile page in the future. Just a placeholder for now.
    redirect_to equipment_index_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
