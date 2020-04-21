require 'rails_helper'

RSpec.describe Region, type: :model do

  describe "attributes" do
    it "has a name" do
      region = Region.new
      expect(region).to respond_to(:name)
    end
  end

  describe "relationships" do
    it "has many tickets" do
      region = Region.new
      expect(region).to have_many(:tickets)
    end
  end

  # Validations

  # Methods

end
