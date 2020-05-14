FactoryBot.define do
  factory :region do
    sequence(:name) { |n| "FAKE #{n}" }
    # name { 'FAKE' + (rand(1..1000).to_s) }
    trait :unspecified do
      name { 'Unspecified' }
    end
  end
end