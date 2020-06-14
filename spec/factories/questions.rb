FactoryBot.define do
  factory :question do
    sequence(:name) { |n| "test_question#{n}" }
    sequence(:description) { |n| "test content" }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/test_question.jpg')) }
    association :user
  end
end
