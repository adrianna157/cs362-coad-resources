FactoryBot.define do
  
  factory :user do
      email 
      password {'fake_password'}

      trait :admin do
          role{:admin}
      end

      trait :organization_member do
          role{:organization}
      end

      after :create do |user|
          user.confirm
      end
  end
end