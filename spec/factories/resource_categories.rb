FactoryBot.define do
    factory :resource_category do
        name {'THE NAME'+ (rand(1..1000).to_s)}
        organization_ids{create(:organization).id}

        trait :active do
        active{true}
        end
        trait :inactive do
            active{false}
        end
    end
end