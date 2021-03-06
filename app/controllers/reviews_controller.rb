class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_equipment
  before_action :set_review, only: %i[edit update destroy]

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
    authorize @review
    if current_user.nil?
      @booking = Booking.new
      flash.now[:alert] = "You must be signed in to leave a review"
      render "/equipment/show"
    else
      @review.user_id = current_user.id

      if @equipment.user_id == @review.user_id
        @booking = Booking.new
        flash.now[:alert] = "You cannont review your own equipment"
        render "/equipment/show"
      else  
        if @review.save
          redirect_to equipment_path(@equipment)
        else
          @booking = Booking.new
          render "/equipment/show"
        end
      end
    end
  end

  def edit
    authorize @review
  end

  def update
    authorize @review
    if @review.update(review_params)
      redirect_to equipment_path(@equipment)
    else
      render "new"
    end
  end

  def destroy
    authorize @review
    @review.destroy
    redirect_to equipment_path(@equipment)
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:equipment_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end
end
