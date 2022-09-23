require "rails_helper"

RSpec.describe CategorizationResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "categorizations",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CategorizationResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Categorization.count }.by(1)
    end
  end

  describe "updating" do
    let!(:categorization) { create(:categorization) }

    let(:payload) do
      {
        data: {
          id: categorization.id.to_s,
          type: "categorizations",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CategorizationResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { categorization.reload.updated_at }
      # .and change { categorization.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:categorization) { create(:categorization) }

    let(:instance) do
      CategorizationResource.find(id: categorization.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Categorization.count }.by(-1)
    end
  end
end
