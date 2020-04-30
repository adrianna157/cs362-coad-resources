FactoryBot.define do
    factory :resource_category do
        name {'THE NAME'}
        organization_ids{create(:organization).id}
    end
end