class Api::V1::CategorizationsController < Api::V1::GraphitiController
  def index
    categorizations = CategorizationResource.all(params)
    respond_with(categorizations)
  end

  def show
    categorization = CategorizationResource.find(params)
    respond_with(categorization)
  end

  def create
    categorization = CategorizationResource.build(params)

    if categorization.save
      render jsonapi: categorization, status: 201
    else
      render jsonapi_errors: categorization
    end
  end

  def update
    categorization = CategorizationResource.find(params)

    if categorization.update_attributes
      render jsonapi: categorization
    else
      render jsonapi_errors: categorization
    end
  end

  def destroy
    categorization = CategorizationResource.find(params)

    if categorization.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: categorization
    end
  end
end
