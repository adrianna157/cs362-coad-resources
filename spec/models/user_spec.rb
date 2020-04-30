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
end
