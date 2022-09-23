require 'rails_helper'

RSpec.describe CategorizationResource, type: :resource do
  describe 'serialization' do
    let!(:categorization) { create(:categorization) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(categorization.id)
      expect(data.jsonapi_type).to eq('categorizations')
    end
  end

  describe 'filtering' do
    let!(:categorization1) { create(:categorization) }
    let!(:categorization2) { create(:categorization) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: categorization2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([categorization2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:categorization1) { create(:categorization) }
      let!(:categorization2) { create(:categorization) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            categorization1.id,
            categorization2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            categorization2.id,
            categorization1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
