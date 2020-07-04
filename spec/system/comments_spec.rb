require 'rails_helper'

RSpec.describe "Comments", type: :system, js: true do
  let(:user_a){create(:suzuki)}
  let(:user_b){create(:tanaka)}
  let!(:question_a) { FactoryBot.create(:question, name: 'first title', description: 'first content', user: user_a) }

  describe "visit new" do
    # ログイン済みのユーザーならコメント画面に遷移できる
    it "logged in user" do
      # ログインする
      visit login_path
      fill_in 'E-mail', with: user_b.email, match: :first
      fill_in 'Password', with: 'tanaka1234'
      within '.login-form' do
      click_on 'Log in'
      end
      # 質問詳細画面
      visit question_path(id: question_a.id)
      find('.fa-comment').click
      # 新規コメント画面
      expect(page).to have_content 'New Comment!'
      expect(page).to have_content 'Content'
      expect(page).to have_button 'Comment'
    end

    # ログインしていないユーザーならコメント画面に遷移できない
    it "not logged in user" do
      # 質問詳細画面
      visit question_path(id: question_a.id)
      expect(page).not_to have_selector '.fa-comment'
    end
  end
end
