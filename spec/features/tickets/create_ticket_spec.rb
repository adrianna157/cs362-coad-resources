require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do

    let(:user) {create(:user)} 
    let(:region) {create(:region)}

    it 'Get Help option is displayed' do
        visit root_path
        click_on 'Get Help'
        # expect(page).to redirect_to(tickets_url)
        fill_in 'Full Name', with: 'Fake Name'
        fill_in 'Phone Number', with: '1231234567'
        select @region.unspecified, from: 'Region'
    end

end
