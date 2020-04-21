require 'rails_helper'

RSpec.describe Region, type: :model do

  describe "attributes" do
    it "has a name" do
      region = Region.new
      expect(region).to respond_to(:name)
    end
  end


  # Properties / Attributes

  # Relationship

  # Validations

  # Methods

end
