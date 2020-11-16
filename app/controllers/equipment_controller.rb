class EquipmentController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def new
    @equipment = Equipment.new()
  end

  def create
    @equipment = Equipment.new(equipment_params)
    @equipment.user_id = current_user
    if equipment.save
      # redirect_to equipment_path(@equipment)
      # redirecting to root to avoid not having a show page right now
      redirect_to '/'
    else
      render "new"
    end
  end

  private

  def equipment_params
    params.require(:equipment).permit(:title, :price, :description, :category, :location)
  end
end
