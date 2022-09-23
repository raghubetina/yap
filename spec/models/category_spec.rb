require "rails_helper"

RSpec.describe Category, type: :model do
  describe "Direct Associations" do
    it { should have_many(:categorizations) }
  end

  describe "InDirect Associations" do
    it { should have_many(:places) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
end
