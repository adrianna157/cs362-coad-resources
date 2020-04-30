require 'rails_helper'

RSpec.describe Region, type: :model do

    let (:region) { Region.new() }

    describe "name" do 
        it "has a name" do
            expect(region).to respond_to(:name)
        end
    end

    describe "relationships" do
        it "has many tickets" do
            expect(region).to have_many(:tickets)
        end
    end

    describe "validations" do
        it "validates presences of name" do
            expect(region).to validate_presence_of(:name)
        end
        it "validates length of name" do
            expect(region).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
        end
        it "validates uniqueness of name" do
            expect(region).to validate_uniqueness_of(:name).case_insensitive
        end
    end

    describe "methods" do
        describe "#to_s" do
            it "has a string that is a name" do
                expected_name = 'FAKE'
                region = Region.new(name: expected_name)
                expect(region.to_s).to eq('FAKE')
            end
        end
        describe "::unspecified" do
            it "creates regions that are unspecified" do
                unspecified_name = 'Unspecified'
                region = Region.new(name: unspecified_name)
                expect(region.name).to eq('Unspecified')
            end
        end
    end
end


