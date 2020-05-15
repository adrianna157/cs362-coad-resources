require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do

    context 'As a public user' do
        describe '/resource_categories' do
            specify { expect(get(:index)).to redirect_to(new_user_session_path) }
        end
    end

    context 'As an organization user' do
        let(:user) {create(:user)}
        before(:each) {sign_in(user)}

        describe 'GET #index' do
            specify{expect(get(:index)).to redirect_to(dashboard_path)}
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
