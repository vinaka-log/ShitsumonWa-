require 'rails_helper'

RSpec.describe "Questions", type: :system do

  let(:user){create(:suzuki)}
  let(:image) { "#{Rails.root}/app/assets/images/default_question.png" }
  
  before do
    visit login_path
    fill_in 'E-mail', with: user.email, match: :first
    fill_in 'Password', with: 'suzuki1234'
    within '.login-form' do
    click_on 'Log in'
    end
  end

describe 'Visit new' do
    it 'new page' do
       visit new_question_path
       expect(page).to have_text("Let's ask about what you are interested in about Japan.")
       expect(page).to have_text("New Question")
       expect(page).to have_text("Title")
       expect(page).to have_text("Content")
       expect(page).to have_text("Image")
       expect(page).to have_button("Submit")
    end
end 
end
