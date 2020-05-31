require 'rails_helper'


RSpec.describe 'Capturing a ticket', type: :feature do
    
    let (:organization_member1) {create(:user, :organization_member)}
   
    before do
        organization = create(:organization)
        organization.status = 'approved'
        organization.save!
        organization_member1.organization = organization
        organization_member1.save!
        test_ticket = create(:ticket, :open_ticket)
        test_ticket.save!
    end

    it 'displays a submitted ticket' do
        log_in_as(organization_member1)
        visit(dashboard_url)
        click_on 'Tickets'
        expect(page).to have_content("My Organization Edit Organization\nTickets\nStatus: AllOpen My Captured My Closed Region:")
        expect(page).not_to be_nil
    end
end
