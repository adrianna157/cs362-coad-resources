FactoryBot.define do
  #test
  factory :user do
      email {'testertesterson@gmail.com'}
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