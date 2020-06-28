FactoryBot.define do
  factory :like do
    association :user
    association :question
  end
end