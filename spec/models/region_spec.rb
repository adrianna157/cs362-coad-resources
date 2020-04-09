require 'rails_helper'

RSpec.describe Region, type: :model do

  describe 'relationships' do
    it { should have_many(:tickets) }
  end

end
