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
   describe "validations" do
    it "validates presence of name" do
        ticket = Ticket.new
            expect(ticket).to validate_presence_of( :name )
       end
    it "validates presence of phone" do
        ticket = Ticket.new
            expect(ticket).to validate_presence_of( :phone )
       end
    it "validates presence of region id" do
        ticket = Ticket.new
            expect(ticket).to validate_presence_of( :region_id )
       end
    it "validates presence of resource category" do
        ticket = Ticket.new
            expect(ticket).to validate_presence_of( :resource_category_id )
       end      
   end      
end
