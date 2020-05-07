require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do

    context 'As a public user' do
        describe '/resource_categories' do
            specify { expect(get(:index)).to redirect_to(new_user_session_path) }
        end
    end



end
