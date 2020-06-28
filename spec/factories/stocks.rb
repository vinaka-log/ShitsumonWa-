FactoryBot.define do
  factory :stock do
    association :user
    association :question
  end
end
