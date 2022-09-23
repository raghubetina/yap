class CategorizationsController < ApplicationController
  before_action :set_categorization, only: %i[show edit update destroy]

  # GET /categorizations
  def index
    @q = Categorization.ransack(params[:q])
    @categorizations = @q.result(distinct: true).includes(:place,
                                                          :category).page(params[:page]).per(10)
  end

  # GET /categorizations/1
  def show; end

  # GET /categorizations/new
  def new
    @categorization = Categorization.new
  end

  # GET /categorizations/1/edit
  def edit; end

  # POST /categorizations
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

  # PATCH/PUT /categorizations/1
  def update
    if @categorization.update(categorization_params)
      redirect_to @categorization,
                  notice: "Categorization was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /categorizations/1
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

  # Use callbacks to share common setup or constraints between actions.
  def set_categorization
    @categorization = Categorization.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def categorization_params
    params.require(:categorization).permit(:place_id, :category_id)
  end
end
