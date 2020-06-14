FactoryBot.define do
  factory :user do
      sequence(:name) { |n| "test_user#{n}" }
      sequence(:email) { |n| "test#{n}@example.com" }
      nationality { "japan" }
      password { "pass1234" }
  end 
 
end
