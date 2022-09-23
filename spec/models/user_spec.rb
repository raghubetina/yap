require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:reviews) }

    end

    describe "InDirect Associations" do

    it { should have_many(:reviewed_places) }

    end

    describe "Validations" do

    it { should validate_presence_of(:first_name) }

    it { should validate_presence_of(:last_name) }

    end
end
