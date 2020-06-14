FactoryBot.define do
  factory :comment do
    content { "test content" }
    association :question
    user { question.user }
  end
end
