class EquipmentController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @equipment = Equipment.all
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)
    @equipment.user = current_user

    if @equipment.save
      redirect_to equipment_path(@equipment)
    else
      render "new"
    end
  end

  private

  def equipment_params
    params.require(:equipment).permit(:title, :price, :description, :category, :location)
  end
end
