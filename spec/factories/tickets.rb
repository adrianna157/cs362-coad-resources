FactoryBot.define do
  factory :ticket do
    name { 'FAKE NAME' }
    description { 'FAKE TICKET DESCRIPTION' }
    phone { '+14242424242' }
    closed { false }
    closed_at { '' }
    region
    resource_category

    trait :open_ticket do
      closed{ false }
    end

    trait :closed_ticket do
      closed{ true }
    end

    trait :with_organization do
      organization
    end

  end


end