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

    describe 'method' do
        it 'has a string that is a name' do
            expected_email = 'fake@example.com'
            user = User.new(email: expected_email)
            expect(user.to_s).to eq(expected_email)
        end
    end 
end
