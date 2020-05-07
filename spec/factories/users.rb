FactoryBot.define do
  
  factory :user do
<<<<<<< HEAD
      email
=======
      email 
>>>>>>> 71b73e3f1ed8809fb429f564795d1b084e960ab6
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