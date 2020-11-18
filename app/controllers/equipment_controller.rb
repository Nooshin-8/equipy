class EquipmentController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_equipment, only: %i[edit update destroy]

  def index
    # @equipment = Equipment.all
    @equipment = policy_scope(Equipment).order(created_at: :desc)

    @markers = @equipment.geocoded.map do |equipment|
      {
        lat: equipment.latitude,
        lng: equipment.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { equipment: equipment })
      }
    end
  end

  def show
    @equipment = Equipment.find(params[:id])
    @booking = Booking.new

    @markers = [ {lat: @equipment.latitude, lng: @equipment.longitude} ]

    authorize @equipment
  end

  def new
    @equipment = Equipment.new
    authorize @equipment
  end

  def create
    @equipment = Equipment.new(equipment_params)
    @equipment.user = current_user

    authorize @equipment

    if @equipment.save
      redirect_to equipment_path(@equipment)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @equipment.update(equipment_params)
    redirect_to equipment_path(@equipment)
  end

  def destroy
    @equipment.destroy
    redirect_to equipment_index_path
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:id])
    authorize @equipment
  end

  def equipment_params
    params.require(:equipment).permit(:title, :price, :description, :category, :location, photos: [])
  end
end
