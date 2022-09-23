class ReviewsController < ApplicationController
  before_action :current_user_must_be_review_reviewer, only: [:edit, :update, :destroy] 

  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  def index
    @q = current_user.reviews.ransack(params[:q])
    @reviews = @q.result(:distinct => true).includes(:reviewer, :place).page(params[:page]).per(10)
  end

  # GET /reviews/1
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      message = 'Review was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @review, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      redirect_to @review, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
    message = "Review was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to reviews_url, notice: message
    end
  end


  private

  def current_user_must_be_review_reviewer
    set_review
    unless current_user == @review.reviewer
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:place_id, :reviewer_id, :rating)
    end
end
