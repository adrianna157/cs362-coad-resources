require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do

    let(:user) {create(:user)} 

    it 'Get Help option is displayed' do
        visit('/')
        click_on 'Get Help'
        # expect(page).to redirect_to(new_ticket)
    end

end
