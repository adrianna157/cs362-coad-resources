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
        it "validates presences of email" do
            expect(user).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
        end
        it "validates uniqueness of email" do
            expect(user).to validate_uniqueness_of(:email).case_insensitive
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
