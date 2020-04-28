require 'rails_helper'

RSpec.describe Organization, type: :model do

    let (:organization) { Organization.new() }

    describe 'attributes' do
        it 'has an email' do
            expect(organization).to respond_to(:email)
        end
        it 'has a name' do
            expect(organization).to respond_to(:name)
        end
        it 'has a phone' do
            expect(organization).to respond_to(:phone)
        end
        it 'has a status' do
            expect(organization).to respond_to(:status)
        end
        it 'has a primary name' do
            expect(organization).to respond_to(:primary_name)
        end
        it 'has a secondary name' do
            expect(organization).to respond_to(:secondary_name)
        end
        it 'has a secondary phone' do
            expect(organization).to respond_to(:secondary_phone)
        end
    end

    describe 'relationship' do
        it 'has many tickets' do
            expect(organization).to have_many(:tickets)
        end
        it 'has many users' do
            expect(organization).to have_many(:users)
        end
        it 'has and belongs to many resource categories' do
            expect(organization).to have_and_belong_to_many(:resource_categories)
        end
    end

    describe 'validation' do
        it 'validates presence of email' do
            expect(organization).to validate_presence_of(:email)
        end 
        it 'validates length of email' do
            expect(organization).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
        end
        it 'validates format of email' do
            expect(organization).to allow_value('valid@example.com').for(:email)
            expect(organization).to_not allow_value('invalid.com', '@invalid.com', 'INVALID', 'invalid@fake').for(:email)
        end 
        it 'validates uniqueness of email' do
            expect(organization).to validate_uniqueness_of(:email).case_insensitive
        end
        it 'validates presence of name' do
            expect(organization).to validate_presence_of(:name)
        end
        it 'validates length of name' do
            expect(organization).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
        end
        it 'validates uniqueness of name' do
            expect(organization).to validate_uniqueness_of(:name).case_insensitive
        end
        it 'validates presence of phone' do
            expect(organization).to validate_presence_of(:phone)
        end
        it 'validates presence of status' do
            expect(organization).to validate_presence_of(:status)
        end
        it 'validates presence of primary_name' do
            expect(organization).to validate_presence_of(:primary_name)
        end
        it 'validates presence of secondary name' do
            expect(organization).to validate_presence_of(:secondary_name)
        end
        it 'validates presence of secondary phone' do
            expect(organization).to validate_presence_of(:secondary_phone)
        end
    end

    describe 'method' do
        it 'has a string that is a name' do
            expected_name = 'FAKE'
            organization = Organization.new(name: expected_name)
            expect(organization.to_s).to eq(expected_name)
        end
        it 'has an approve method' do
            expect(organization.approve).to be_truthy
        end
        it 'has a reject method' do
            expect(organization.reject).to be_truthy
        end
        it 'has a set default status method' do
            expect(organization.set_default_status).to be_truthy
        end
    end 
end
