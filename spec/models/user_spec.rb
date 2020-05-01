require 'rails_helper'

RSpec.describe User, type: :model do

  let(:normal_user) { build(:organization_member) }
  let(:admin) { build(:admin) }

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
