

FactoryBot.define do
    factory :organization do
        email {'testertesterson@gmail.com'}
        name {'THIS IS A NAME'}
        phone {'888-888-8888'}
        description {"this is a test organization"}
        liability_insurance{true}
        primary_name {'primary name'}
        secondary_name {'secondary name'}
        secondary_phone {'888-888-8888'}
        title{'title'}
        transportation {:yes}

        trait :approved do
            status{0}
        end

        trait :rejected do
            status{2}
        end

        trait :locked do
            status {3} 
        end
    end
end