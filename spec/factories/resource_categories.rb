FactoryBot.define do
    factory :resource_category do
        sequence(:name) { |n| "the name #{n}" }
        # name {'THE NAME'}
        organization_ids{create(:organization).id}

        trait :active do
            name{'Fake Name'}    
            active{true}
        end
        trait :inactive do
            active{false}
        end
    end
end