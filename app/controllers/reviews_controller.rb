class ReviewsController < ApplicationController
  before_action :current_user_must_be_review_reviewer,
                only: %i[edit update destroy]

  before_action :set_review, only: %i[show edit update destroy]

  def index
    @q = current_user.reviews.ransack(params[:q])
    @reviews = @q.result(distinct: true).includes(:reviewer,
                                                  :place).page(params[:page]).per(10).order(created_at: :desc)
  end

  def show; end

  def new
    @review = Review.new
  end

  def edit; end

  def create
    @review = Review.new(review_params)

    if @review.save
      message = "Review was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @review.place, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @review.update(review_params)
      redirect_to @review.place, notice: "Review was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    message = "Review was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to reviews_url, notice: message
    end
  end

  private

  def current_user_must_be_review_reviewer
    set_review
    unless current_user == @review.reviewer
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:place_id, :reviewer_id, :rating, :body)
  end
end
