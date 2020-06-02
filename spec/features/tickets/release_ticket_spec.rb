require 'rails_helper'

RSpec.describe 'Releasing a ticket by an already submitted ticket', type: :feature do
    
    let (:organization_member1) {create(:user, :organization_member)}
    let(:test_ticket) {create(:ticket, :open_ticket)}
    
    before :each do
        organization = create(:organization)
        organization.status = 'approved'
        organization.save!
        organization_member1.organization = organization
        organization_member1.save!
    end

    it 'releases a ticket ' do
        log_in_as(organization_member1)
        visit ticket_path(test_ticket.id)
        click_on 'Capture'
        click_on 'FAKE NAME'
        click_on 'Release'
        expect(page).to have_content("My Organization Edit Organization\nTickets")
        expect(page).not_to be_nil
    end
end
