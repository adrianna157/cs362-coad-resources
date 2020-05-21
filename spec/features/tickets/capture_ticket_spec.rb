require 'rails_helper'
require '/Users/adriannaguevarra/Desktop/Projects/SoftwareEngineeringII/cs362-coad-resources/spec/support/user_helper.rb'

RSpec.describe 'Capturing a ticket', type: :feature do
    
    let (:organization_member1) {create(:user, :organization_member)}
   
    it 'displays a submitted ticket' do
        log_in_as(organization_member1)
        visit(dashboard_url)
       expect(page).to have_field 'tab'
    end
end
