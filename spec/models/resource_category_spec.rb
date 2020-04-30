require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

    let (:resource_category) { ResourceCategory.new() }

    describe 'attributes' do
        it 'has a name' do
            expect(resource_category).to respond_to(:name)
        end
    end
        
    describe 'relationship' do
        it 'has and belongs to many organizations' do
            expect(resource_category).to have_and_belong_to_many(:organizations)
        end
        it 'has many tickets' do
            expect(resource_category).to have_many(:tickets)
        end
    end

    describe 'validations' do
        it "validates presences of name" do
            expect(resource_category).to validate_presence_of(:name)
        end
        it "validates length of name" do
            expect(resource_category).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
        end
        it "validates uniqueness of name" do
            expect(resource_category).to validate_uniqueness_of(:name).case_insensitive
        end
    end

    describe 'methods' do
        describe '::unspecified' do
            it "creates resource categories that are unspecified" do
                expect(ResourceCategory.where(name: 'Unspecified')).to be_empty
                expect{ResourceCategory.unspecified}.to change{ResourceCategory.count}.by(1)
            end
        end
        describe "#to_s" do
            it 'has a string that is a name' do
                expected_name = 'FAKE'
                resource_category = ResourceCategory.new(name: expected_name)
                expect(resource_category.to_s).to eq(expected_name)
            end
        end
        describe '#activate' do
            it 'activates resource category' do
                expect(resource_category.active).to be_truthy
            end
        end
        describe '#deactivate' do
            it 'deactivates resource category' do
                expect(resource_category.deactivate).to be_falsey
            end
        end
    end

end
