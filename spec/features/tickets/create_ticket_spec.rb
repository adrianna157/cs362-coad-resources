require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do

    
    before :each do
        @region = Region.create(name: 'Fake Region')
        @resource_category = ResourceCategory.create(name: 'Fake Resource Category')
    end
    #let(:resource_category) = (create(:resource_category, :name))

    it 'Displays a successfull ticket submission' do
        visit root_path
        click_on 'Get Help'
        # expect(page).to redirect_to(tickets_url)
        fill_in 'Full Name', with: 'Fake Name'
        fill_in 'Phone Number', with: '3036531234'
        select @region.name, from: 'Region'
        select @resource_category.name, from: 'Resource Category'
        fill_in 'Description', with: 'Fake'
        click_on 'Send this help request'
        expect(page).to have_content('Ticket Submitted')

    end

end
