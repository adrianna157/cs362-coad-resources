FactoryBot.define do
    factory :resource_category do
        sequence(:name) { |n| "the name #{n}" }
        # name {'THE NAME'}
        organization_ids{create(:organization).id}
    end
end