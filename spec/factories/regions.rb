FactoryBot.define do
  factory :region do

    name { 'FAKE' }
    trait :unspecified do
      name { 'Unspecified' }
    end
  end
end
=======
    name { 'Fake' }
    trait :unspecified do
      name { 'Unspecified' }
    end

  end
end