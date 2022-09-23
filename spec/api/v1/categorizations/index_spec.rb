require "rails_helper"

RSpec.describe "categorizations#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/categorizations", params: params
  end

  describe "basic fetch" do
    let!(:categorization1) { create(:categorization) }
    let!(:categorization2) { create(:categorization) }

    it "works" do
      expect(CategorizationResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["categorizations"])
      expect(d.map(&:id)).to match_array([categorization1.id,
                                          categorization2.id])
    end
  end
end
