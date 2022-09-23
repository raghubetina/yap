require 'rails_helper'

RSpec.describe Categorization, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:category) }

    it { should belong_to(:place) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
