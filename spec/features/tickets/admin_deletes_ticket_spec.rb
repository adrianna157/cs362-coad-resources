require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
    
    let (:ticket) {create(:ticket)}
    let (:admin_member) {create(:user, :admin)}

    it 'Displays a success screen for deleted ticket' do
        log_in_as(admin_member)
        visit dashboard_path
        # expect(page).to have_content('FAKE NAME')
        # click_link ticket.name
    end
end
