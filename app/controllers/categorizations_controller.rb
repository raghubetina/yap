class CategorizationsController < ApplicationController
  before_action :set_categorization, only: [:show, :edit, :update, :destroy]

  # GET /categorizations
  def index
    @categorizations = Categorization.all
  end

  # GET /categorizations/1
  def show
  end

  # GET /categorizations/new
  def new
    @categorization = Categorization.new
  end

  # GET /categorizations/1/edit
  def edit
  end

  # POST /categorizations
  def create
    @categorization = Categorization.new(categorization_params)

    if @categorization.save
      redirect_to @categorization, notice: 'Categorization was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /categorizations/1
  def update
    if @categorization.update(categorization_params)
      redirect_to @categorization, notice: 'Categorization was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categorizations/1
  def destroy
    @categorization.destroy
    redirect_to categorizations_url, notice: 'Categorization was successfully destroyed.'
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
