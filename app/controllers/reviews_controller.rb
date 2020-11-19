class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_equipment, only: %i[index show new create]
  before_action :set_review, only: %i[edit destroy]

  def index
    @reviews = policy_scope(Review).order(created_at: :desc)
  end

  def show
  end

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.equipment = @equipment
    @review.user_id = current_user.id
    
    authorize @review
    
    if @review.save
      redirect_to equipment_path(@equipment)
    else
      @booking = Booking.new
      render "/equipment/show"
    end
  end

  def edit
    @equipment = Equipment.find(params[:id])
    @review = Review.find(params[:equipment_id])
    authorize @review
  end

  def update
    @equipment = Equipment.find(params[:equipment_id])
    @review = Review.find(params[:id])
    authorize @review
    if @review.update(review_params)
      redirect_to equipment_path(@equipment)
    else
      render "new"
    end
  end

  def destroy
    @equipment = Equipment.find(params[:id])
    @review = Review.find(params[:equipment_id])
    authorize @review
    @review.destroy
    redirect_to equipment_path(@equipment)
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:equipment_id])
  end

  def set_review
    @review = Review.find(params[:equipment_id])
  end

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end
end
