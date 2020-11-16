class EquipmentController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
end
