require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

    let (:resource_category) { ResourceCategory.new() }

    describe 'attributes' do
        it 'has a name' do
            expect(resource_category).to respond_to(:name)
        end
    end
end
