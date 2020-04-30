require 'rails_helper'

RSpec.describe User, type: :model do

    let (:user) { User.new() }

    describe 'attributes' do
        it 'has an email' do
            expect(user).to respond_to(:email)
        end
    end
    describe 'relationship' do
        it 'belongs to an organization' do
            expect(user).to belong_to(:organization)
        end
    end

    describe 'validation' do
        it 'validates presence of email' do
            expect(user).to validate_presence_of(:email)
        end 
        it "validates length of email" do
            expect(user).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
        end
        it 'validates format of email' do
            expect(user).to allow_value('valid@example.com').for(:email)
            expect(user).to_not allow_value('invalid.com', '@invalid.com', 'INVALID', 'invalid@fake').for(:email)
        end 
        it "validates uniqueness of email" do
            expect(user).to validate_uniqueness_of(:email).case_insensitive
        end
        it 'validates presence of password' do
            expect(user).to validate_presence_of(:password).on(:create)
        end 
        it "validates lenght of password" do
            expect(user).to validate_length_of(:password).is_at_least(7).is_at_most(255).on(:create)
        end
    end

    describe 'method' do
        describe "#to_s" do
            it 'has a string that is a name' do
                expected_email = 'fake@example.com'
                user = User.new(email: expected_email)
                expect(user.to_s).to eq(expected_email)
            end
        end
        # describe "#set_default_role" do
        # end
    end 

end
