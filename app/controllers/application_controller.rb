class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_user_data

  include Pundit

  # Pundit: white-list approach. (every action is denied unless I allow it)
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def set_user_data
    @user = current_user

    # Get all the user's equipment
    @my_equipment = Equipment.where(user: @user)

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
end
