FactoryBot.define do
  sequence :email do |n|
    "fake#{n}@factory.com"
  end
end
