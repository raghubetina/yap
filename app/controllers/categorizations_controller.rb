class CategorizationsController < ApplicationController
  before_action :set_categorization, only: %i[show edit update destroy]

  def index
    @q = Categorization.ransack(params[:q])
    @categorizations = @q.result(distinct: true).includes(:place,
                                                          :category).page(params[:page]).per(10)
  end

  def show; end

  def new
    @categorization = Categorization.new
  end

  def edit; end

  def create
    @categorization = Categorization.new(categorization_params)

    if @categorization.save
      message = "Categorization was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @categorization, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @categorization.update(categorization_params)
      redirect_to @categorization,
                  notice: "Categorization was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @categorization.destroy
    message = "Categorization was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to categorizations_url, notice: message
    end
  end

  private

  def set_categorization
    @categorization = Categorization.find(params[:id])
  end

  def categorization_params
    params.require(:categorization).permit(:place_id, :category_id)
  end
end
