require 'rails_helper'

RSpec.describe Review, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:place) }

    it { should belong_to(:reviewer) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:rating) }

    end
end
