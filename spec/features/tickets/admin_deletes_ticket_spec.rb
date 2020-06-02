require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
    
   let (:admin_member1) {create(:user, :admin)}
   
    before do
        organization = create(:organization)
        organization.status = 'approved'
        organization.save!
        admin_member1.organization = organization
        admin_member1.save!
        test_ticket = create(:ticket, :open_ticket)
        test_ticket.save!
    end
    it 'releases a ticket ' do
        log_in_as(admin_member1)
        visit dashboard_url
        click_on 'FAKE NAME'
        click_on 'Delete'
        expect(page).to have_content("Ticket 1 was deleted")
        expect(page).not_to be_nil
    end
end
