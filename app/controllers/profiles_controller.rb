class ProfilesController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show

    # Bookings the current user made
    @my_bookings = Booking.where(user: current_user)

    # Get all the user's equipment
    @my_equipment = Equipment.where(user: current_user)

    # Bookings people made on current user's equipment
    ## For each equipment, get the pending booking(s) associated
    ## => Returns an array containing one entry per equipment.
    @my_equipment_bookings = @my_equipment.map do |equipment|
      Booking.where(equipment: equipment).where(accepted: 'pending')
    end

    ## Removes the empty entries coming from equipment without bookings.
    ## => Returns an array of arrays [[booking1, booking2], [booking]]
    @my_equipment_bookings.reject!(&:empty?)

    @pending_requests_count = @my_equipment_bookings.sum(&:count)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
    authorize @user
  end

  def user_params
    params.require(:user).permit(:email, :profile_picture, :username)
  end
end
