require 'rails_helper'

RSpec.describe Region, type: :model do
   describe "name"do 
    it "has a name" do
        region = Region.new
        expect(region).to respond_to(:name)
    end

    describe "relationships"do
        it "has many tickets" do
            region = Region.new
            expect(region).to have_many(:tickets)
        end
    end

    
end

end
