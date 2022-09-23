require 'rails_helper'

RSpec.describe Place, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:categorizations) }

    it { should have_many(:reviews) }

    end

    describe "InDirect Associations" do

    it { should have_many(:categories) }

    end

    describe "Validations" do

    it { should validate_presence_of(:name) }

    end
end
