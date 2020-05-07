
require 'rails_helper'

RSpec.describe Ticket, type: :model do


    let(:closed_ticket){create(:closed_ticket)}
    let(:open_ticket){create(:ticket)} 
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

end      
