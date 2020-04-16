require 'rails_helper'

RSpec.describe Organization, type: :model do
    describe 'relationship' do
        it 'should have many tickets and users' do
            organization = Organization.new
            expect(organization).to respond_to(:tickets, :users)
        end

        it 'should have and belong to many resource categories' do
            organization = Organization.new
            expect(organization).to respond_to(:resource_categories)
        end

        it 'has and email' do
            user = User.new
            expect(user).to respond_to(:email)
        end

    end

end
