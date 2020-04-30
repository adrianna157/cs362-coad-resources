FactoryBot.define do
  factory :ticket do
    name { 'FAKE NAME' }
    description { 'FAKE TICKET DESCRIPTION' }
    phone { '+14242424242' }
    created_at { nil }
    updated_at { nil }
    closed { false }
    closed_at { '' }
    region_id { create(:region).id }
    resource_category_id { create(:resource_category).id }
  end
end