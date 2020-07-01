require 'rails_helper'

RSpec.describe "Questions", type: :system do
  
before do
    @question = FactoryBot.create(:question)
end

it "visiting questions/new" do
  visit new_question_path
  expect(page).to have_text("Let's ask about what you are interested in about Japan.")
  expect(page).to have_text("New Question")
  expect(page).to have_field("Title")
  expect(page).to have_field("Content")
  expect(page).to have_field("Image")
  expect(page).to have_button("Submit")
 end



  
end
