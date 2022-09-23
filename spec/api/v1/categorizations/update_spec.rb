require "rails_helper"

RSpec.describe "categorizations#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/categorizations/#{categorization.id}", payload
  end

  describe "basic update" do
    let!(:categorization) { create(:categorization) }

    let(:payload) do
      {
        data: {
          id: categorization.id.to_s,
          type: "categorizations",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CategorizationResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { categorization.reload.attributes }
    end
  end
end
