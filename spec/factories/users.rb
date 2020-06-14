FactoryBot.define do
  factory :user do
    factory :user do
      sequence(:name) { |n| "test_user#{n}" }
      sequence(:email) { |n| "test#{n}@example.com" }
      nationality { "japan" }
      password { "password" }
      password_confirmation { "password" }
    end 
  end
end
