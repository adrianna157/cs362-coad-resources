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
        let(:resource_category) {create(:resource_category)}
        before(:each) {sign_in(admin_user)}
        
        describe 'GET #index' do
            specify{expect(get(:index)).to be_successful}
        end

         describe 'GET #show' do
            it "gets show successfully" do
                expect(get(:show, params: { id: resource_category.id })).to be_successful
            end
        end

        describe 'GET #new' do
            it "gets new successfully" do
                expect(get(:new, params: { id: resource_category.id })).to be_successful
            end
        end

        describe 'POST #create' do
            it "gets show successfully" do
                expect(post(:create, params: { id: resource_category.id, resource_category: attributes_for(:resource_category) })).to redirect_to(resource_categories_path)
            end
        end

         describe 'GET #edit' do
            it "gets edit successfully" do
                expect(get(:edit, params: { id: resource_category.id })).to be_successful
            end
        end

        describe 'PUT #update' do
            it "puts update successfully" do
                expect(get(:update, params: { id: resource_category.id, resource_category: attributes_for(:resource_category)})).to redirect_to(resource_category_path(resource_category))
            end
        end

         describe 'PATCH #update' do
            it "patch ativate successfully" do
                expect(get(:activate, params: { id: resource_category.id, resource_category: attributes_for(:resource_category)})).to redirect_to(resource_category_path(resource_category))
            end
        end

        describe 'PATCH #update' do
            it "patch ativate successfully" do
                expect(get(:deactivate, params: { id: resource_category.id, resource_category: attributes_for(:resource_category)})).to redirect_to(resource_category_path(resource_category))
            end
        end


    end

    



end
