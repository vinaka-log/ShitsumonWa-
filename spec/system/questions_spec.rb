require 'rails_helper'

RSpec.describe "Questions", type: :system, js: true do

  let(:user_a){create(:suzuki)}
  let!(:question_a) { FactoryBot.create(:question, name: 'first title', description: 'first content', user: user_a) }
  let(:image) { "#{Rails.root}/app/assets/images/default_question.png" }

    before do
      visit login_path
      fill_in 'E-mail', with: user_a.email, match: :first
      fill_in 'Password', with: 'suzuki1234'
      within '.login-form' do
      click_on 'Log in'
      end
    end

  describe 'visit new', use_truncation: false do

  #新規質問ページ
    it 'new page' do
      visit new_question_path
      expect(page).to have_text("Let's ask about what you are interested in about Japan.")
      expect(page).to have_text("New Question")
      expect(page).to have_text("Title")
      expect(page).to have_text("Content")
      expect(page).to have_text("Image")
      expect(page).to have_button("Submit")
    end

  #新規質問投稿
    it 'question new' do
      visit new_question_path
      fill_in 'Title', with: 'test'
      fill_in 'Content', with: 'testtestest'
      attach_file('question[image]', image)
      click_on 'Submit'

      expect(current_path).to eq questions_path
      expect(page).to have_text "Question save"
    end
  end 

  #質問の詳細ページ
  describe 'visit show' do
    it 'question show' do
      visit question_path(id: question_a.id)
      expect(page).to have_content 'first title'
      expect(page).to have_content 'first content'
      expect(page).to have_content 'suzuki'
    end
  end

  describe 'Visit edit', use_truncation: false do
  #質問の編集ページ
    it 'edit page' do
      visit edit_question_path(question_a.id)
      expect(page).to have_text("Let's ask about what you are interested in about Japan.")
      expect(page).to have_text("Edit Question")
      expect(page).to have_text("Title")
      expect(page).to have_text("Content")
      expect(page).to have_text("Image")
      expect(page).to have_button("Submit")
    end

  #質問の編集
    it 'question edit' do
      visit edit_question_path(question_a.id)
      fill_in 'Title', with: 'test2'
      fill_in 'Content', with: 'testtestest2'
      attach_file('question[image]', image)
      click_on 'Submit'
      expect(current_path).to eq questions_path
      expect(page).to have_text "Question update"
    end
  end

  #質問の削除
    describe 'Visit delete', use_truncation: false do   
      it 'delete success' do   
        edit_question_path(question_a.id)
        expect(page).to have_css('.fa-trash')
        page.accept_confirm do
        find('.delete-icon').click
        end
        expect(page).to have_content 'Question delete'   
      end
    end

  # validationは別
end
