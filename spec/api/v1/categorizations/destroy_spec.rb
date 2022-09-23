require 'rails_helper'

RSpec.describe "categorizations#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/categorizations/#{categorization.id}"
  end

  describe 'basic destroy' do
    let!(:categorization) { create(:categorization) }

    it 'updates the resource' do
      expect(CategorizationResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Categorization.count }.by(-1)
      expect { categorization.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
