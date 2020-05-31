require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

    context 'As a public user' do
        describe '/tickets/new' do
            specify { expect(get(:new)).to be_successful }
        end
    end

    context 'As an organization user' do
        let(:user) {create(:user)}
        before(:each) {sign_in(user)}
        let(:ticket) {create(:ticket)}

        describe 'GET #new' do
            specify{ expect(get(:new)).to be_successful }
        end

        describe 'POST #release as an organization user' do
            it "post release successfully" do
                expect(post(:release, params: { id: ticket.id})).to redirect_to(dashboard_path)
            end
        end

        describe 'PATCH #close ' do
            it "patch close successfully" do
                expect(patch(:close, params: { id: ticket.id})).to redirect_to(dashboard_path)
            end
        end 
    end

    context 'As an admin' do
        let(:admin_user) {create(:user, :admin)}
        let(:ticket) {create(:ticket)}
        before(:each) {sign_in(admin_user)}
        
        describe 'GET #new' do
            specify{ expect(get(:new)).to be_successful }
        end

        describe 'GET #show' do
            it "gets show successfully" do
                expect(get(:show, params: { id: ticket.id })).to be_successful
            end
        end

        describe 'POST #capture' do
            it "post capture successfully" do
                expect(post(:capture, params: { id: ticket.id})).to redirect_to(dashboard_path)
            end
        end

        describe 'POST #release' do
            it "post release successfully" do
                expect(post(:release, params: { id: ticket.id})).to redirect_to(dashboard_path)
            end
        end 
         
        describe 'PATCH #close ' do
            it "patch close successfully" do
                expect(patch(:close, params: { id: ticket.id})).to redirect_to("\/dashboard#tickets:open")
            end
        end 

         describe 'DELETE #destory' do
            it "delete destroy successfully" do
                expect(delete(:destroy, params: { id: ticket.id})).to redirect_to(dashboard_path << "#tickets")
            end
        end 

    end
end
