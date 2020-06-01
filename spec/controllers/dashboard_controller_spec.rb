require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
    context 'As a public user' do
        describe '/dashboard' do
            specify { expect(get(:index)).to redirect_to(new_user_session_path)}
        end
    end

    context 'As an organization user' do
        let(:user) {create(:user)}
        before(:each) {sign_in(user)}
        let(:ticket_with_region) {create(:ticket, :organization)}

        describe 'GET #index' do
            specify{expect(get(:index)).to be_successful}
        end

        describe 'GET #status options' do
            specify{expect(get(:status_options, params: { status: ticket.status })).to be_successful}
        end
    end

    context 'As an admin' do
        let(:admin_user) {create(:user, :admin)}
        before(:each) {sign_in(admin_user)}
        
        describe 'GET #index' do
            specify{expect(get(:index)).to be_successful}
        end
    end
end
