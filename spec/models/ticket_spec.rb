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
    # it "should allow values"
    #     ticket = Ticket.new
    #     get :organization_id
    #     expect(response.status).to equal("index_tickets_on_organization_id").for(:name)
    #   end
    # it "should allow values"
    #     ticket = Ticket.new
    #     get :region_id
    #     expect(response.status).to equal("index_tickets_on_region_id").for(:name)
    #   end
    # it "should allow values"
    #     ticket = Ticket.new
    #     get :resource_category_id
    #     expect(response.status).to equal("index_tickets_on_resource_category_id").for(:name)
    #   end
    
    it "has open tickets" do
        ticket = Ticket.new

        open_ticket = Ticket.create(closed:false)
        
        closed_ticket = Ticket.create(closed:true)

        open_tickets = Ticket.open
        expect(open_tickets).to include(open_ticket)
        expect(open_ticekts.not_to include(closed_ticket)
    end
   end      
end
