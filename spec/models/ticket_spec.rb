
require 'rails_helper'

RSpec.describe Ticket, type: :model do


    let(:closed_ticket){create(:ticket, :closed_ticket)}
    let(:open_ticket){create(:ticket, :open_ticket)} 
    let(:ticket_with_organization){create(:ticket, :open_ticket, :with_organization)}
    let (:ticket) { Ticket.new() }

    describe "relationships" do
        it "belongs to a region" do
            expect(ticket).to belong_to(:region)
        end
        it "belongs to a resource category" do
            expect(ticket).to belong_to(:resource_category)
        end
        it "belongs to an organization" do
            expect(ticket).to belong_to(:organization)
        end
    end

    describe "validations" do
        it "validates presence of name" do
            expect(ticket).to validate_presence_of( :name )
        end
        it "validates presence of phone" do
            expect(ticket).to validate_presence_of( :phone )
        end
        it "validates presence of region id" do
            expect(ticket).to validate_presence_of( :region_id )
        end
        it "validates presence of resource category" do
            expect(ticket).to validate_presence_of( :resource_category_id )
        end
        it "validates length of name" do
            expect(ticket).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
        end
        it "validates length of description" do
            expect(ticket).to validate_length_of(:description).is_at_most(1020).on(:create)
        end 
    end

    describe 'methods' do
        describe "#to_s" do
            it 'has a string that is a ticket' do
                expected_ticket_id = '1234'
                ticket = Ticket.new(id: expected_ticket_id)
                expect(ticket.to_s).to eq('Ticket ' + expected_ticket_id)
            end
        end
        describe "#open?" do
            it "retrieves only non-closed tickets without an organization" do
                open_tickets = Ticket.open
                expect(open_tickets).to include(open_ticket)
            end
        end
        describe "#captured?" do
            it 'ticket is not captured by default' do
                expect(ticket).to_not be_captured
            end
            it 'ticket is captured if it has an organization' do
                ticket.organization = Organization.new
                expect(ticket).to be_captured
            end

        end
    end

     describe 'scopes' do
        it 'returns open tickets' do
            open_tickets = Ticket.open
            expect(open_tickets).to include(open_ticket)
            expect(open_tickets).to_not include(closed_ticket)
        end
        it 'returns closed tickets' do
            closed_tickets = Ticket.closed
            expect(closed_tickets).to include(closed_ticket)
            expect(closed_tickets).to_not include(open_ticket)
        end
         it 'returns all organizations tickets that are open ' do
            all_organizations_tickets = Ticket.all_organization
            expect(all_organizations_tickets).to include(ticket_with_organization)
            #expects an open ticket without an organization
            expect(all_organizations_tickets).to_not include(open_ticket)
        end


    end

end      
