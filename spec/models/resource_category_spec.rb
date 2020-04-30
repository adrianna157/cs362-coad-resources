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
    end

end
