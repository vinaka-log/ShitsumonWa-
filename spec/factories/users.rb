FactoryBot.define do
  factory :user do
      sequence(:name) { |n| "test_user#{n}" }
      sequence(:email) { |n| "test#{n}@example.com" }
      nationality { "japan" }
      password { "pass12345" }
      password_confirmation { "pass12345" }

      after(:create) do |user|
        user.activate!
      end
  end 
 
end
