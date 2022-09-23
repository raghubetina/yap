require 'rails_helper'

RSpec.describe "categorizations#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/categorizations/#{categorization.id}", params: params
  end

  describe 'basic fetch' do
    let!(:categorization) { create(:categorization) }

    it 'works' do
      expect(CategorizationResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('categorizations')
      expect(d.id).to eq(categorization.id)
    end
  end
end
