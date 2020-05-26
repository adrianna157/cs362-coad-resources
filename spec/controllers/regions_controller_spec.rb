require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

    context 'As a public user' do
        describe '/regions' do
            specify { expect(get(:index)).to redirect_to(new_user_session_path)}
        end
    end

    context 'As an organization user' do
        let(:user) {create(:user)}
        before(:each) {sign_in(user)}

        describe 'GET #index' do
            specify{expect(get(:index)).to redirect_to(dashboard_path)}
        end
    end

    context 'As an admin user' do
        let(:admin_user) {create(:user, :admin)}
        let(:ticket_with_region) {create(:ticket, :organization)}
        let(:region){create(:region)}
       
        #let(:region) {create(:region, :ticket)}
        before(:each) {sign_in(admin_user)}
        
        describe 'GET #index' do
            specify{expect(get(:index)).to be_successful}
        end

        describe 'GET #show' do
            it "gets show successfully" do
                expect(get(:show, params: { id: region.id })).to be_successful
            end
        end

        describe 'GET #new' do
            specify{expect(get(:new)).to be_successful}
        end

        describe 'GET #show' do
            specify{expect(get(:index)).to be_successful}
        end

        # describe 'POST #create' do
        #     specify{post(:create, parameters: {region: {name: 'FAKE'}}).to redirect_to(regions_path)}
        # end

         describe 'POST #edit' do
            it "gets edit successfully" do
                expect(get(:edit, params: { id: region.id })).to be_successful
            end
        end


         describe 'PUT #update' do
             
            it "gets update successfully" do
                #byebug
                expect(put(:update, params: {id: region.id, region: attributes_for(:region)})).to redirect_to(region)
            end
        end

        # describe 'DELETE #destroy' do
        #     region = create(:region)
        #     specify{expect(get(:destroy), parameters: {id: region.id}).to be_successful}
        # end

     
        
        
    end

end
