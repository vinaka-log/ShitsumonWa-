require 'rails_helper'

RSpec.describe "Questions", type: :system do 
  let(:image) { "#{Rails.root}/app/assets/images/children_study.jpg" }
  
  before do
    @user = FactoryBot.create(:user)
  end 
  
  describe "creating a new question" do
    visit new_question_path

    expect {
      fill_in "Title", with: "test title"
      fill_in "Content", with: "test content"
      attach_file('image-form', image)
      
      click_button 'Submit'

      expect(page).not_to have_selector '.alert-alert'
      expect(page).to have_selector '.alert-notice'
    }.to change{ @user.quesitions.count }.by(1)
  end

end

