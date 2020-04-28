require 'rails_helper'

RSpec.describe Ticket, type: :model do

  describe "relationships" do
    it "belongs to" do
        ticket = Ticket.new
        should {belong_to(:region)}
        should {belong_to(:resource_category)}
        should {belong_to(:organization).optional}
        
            
     end
   end    
end
