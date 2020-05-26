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
        let(:resource_categories_admin) {create(:resource_category)}
        before(:each) {sign_in(admin_user)}
        
        describe 'GET #index' do
            specify{expect(get(:index)).to be_successful}
        end

         describe 'GET #show' do
            it "gets show successfully" do
                expect(get(:show, params: { id: resource_categories_admin.id })).to be_successful
            end
        end
    end

    



end
