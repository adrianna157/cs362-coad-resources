require 'rails_helper'

RSpec.describe Region, type: :model do
   describe "name"do 
    it "has a name" do
        region = Region.new
        expect(region).to respond_to(:name)
    end

    describe "relationships"do
        it "has many tickets" do
            region = Region.new
            expect(region).to have_many(:tickets)
        end
    end

    describe "validations" do
        it "validates presences of name" do
            region = Region.new
            expect(region).to validate_presence_of(:name)
        end
        it "validates presences the length of a name" do
            region = Region.new
            expect(region).to validate_length_of(:name, minimum: 1, maximum: 225, on: create)
        end
        it "validates presences the uniqueness of a name" do
            region = Region.new
            expect(region).to validate_uniqueness_of(:name, case_sensitive: false)
        end
    end

    describe "to_s method" do
        it "has a string that is a name"do
        expected_name = 'FAKE'
        region = Region.new(name: expeccted_name)
        expect(region.to_s).to eq(excpected_name)
    end
    
        end



end

end
