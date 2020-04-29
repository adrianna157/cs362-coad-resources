
require 'rails_helper'


RSpec.describe Ticket, type: :model do

  let(:closed_ticket){create(:closed_ticket)}
  let(:open_ticket){create(:ticket)} 


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
    it "validates presences the length of a name" do
            ticket = Ticket.new
            expect(ticket).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
        end
    it "validates presences the length of a name" do
            ticket = Ticket.new
            expect(ticket).to validate_length_of(:description).is_at_most(1020).on(:create)
        end
    # it "validates" do
    #         ticket = Ticket.new
    #         expect(ticket).to validates(:phone).
    #     end
    it "has attributes" do
        ticket = Ticket.new
        expect(ticket).to respond_to(:name, :description, :phone, :organization_id, :created_at,
        :updated_at, :closed_at, :closed, :closed_at, :resource_category_id, :region_id)
    end
end
   
    describe "#open" do
        it "retrieves only non-closed tickets without an organization" do
            open_tickets = Ticket.open
            expect(open_tickets).to include(open_ticket)
            # expect(open)tickets.not_to include(closed_ticket)
        end
    end
   end      

