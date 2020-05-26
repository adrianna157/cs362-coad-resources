require 'rails_helper'

RSpec.describe User, type: :model do

    let(:normal_user) { build(:organization_member) }
    let(:admin) { build(:admin) }
    let (:user) { User.new() }

    describe 'attributes' do
        it 'has an email' do
            expect(user).to respond_to(:email)
        end
    end
    
    describe 'relationship' do
        it 'belongs to an organization' do
            expect(user).to belong_to(:organization).optional
        end
    end

    describe 'validation' do
        it 'validates presence of email' do
            expect(user).to validate_presence_of(:email)
        end 
        it "validates length of email" do
            expect(user).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
        end
        it 'validates format of email' do
            expect(user).to allow_value('valid@example.com').for(:email)
            expect(user).to_not allow_value('invalid.com', '@invalid.com', 'INVALID', 'invalid@fake').for(:email)
        end 
        it "validates uniqueness of email" do
            expect(user).to validate_uniqueness_of(:email).case_insensitive
        end
        it 'validates presence of password' do
            expect(user).to validate_presence_of(:password).on(:create)
        end 
        it "validates lenght of password" do
            expect(user).to validate_length_of(:password).is_at_least(7).is_at_most(255).on(:create)
        end
    end

    describe 'method' do
        describe "#to_s" do
            it 'has a string that is an email' do
                expected_email = 'fake@example.com'
                user = User.new(email: expected_email)
                expect(user.to_s).to eq(expected_email)
            end
        end
        describe "#set_default_role" do
            it 'has a set default role method' do
                expect(user.set_default_role).to be_truthy
            end
        end
    end 

  describe 'an example of verifying your factory is sound' do
    it 'is ok when generated from our factory' do
      first_user = create(:user)
      expect(first_user).to be_valid
      expect(first_user).to be_persisted
      second_user = create(:user)
      expect(second_user).to be_valid
      expect(second_user).to be_persisted
    end
  end

end
