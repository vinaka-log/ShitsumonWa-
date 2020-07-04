require 'rails_helper'

RSpec.describe "Comments", type: :system, js: true do
  let(:user_a){create(:suzuki)}
  let!(:question_a) { FactoryBot.create(:question, name: 'first title', description: 'first content', user: user_a) }

  describe "visit new" do
    # ログイン済みのユーザーならコメント可能
    it "logged in user" do
      # ログインする
      visit login_path
      fill_in 'E-mail', with: user_a.email, match: :first
      fill_in 'Password', with: 'suzuki1234'
      within '.login-form' do
      click_on 'Log in'
      end
      # 質問詳細画面
      visit question_path(id: question_a.id)
      find('.delete-icon').click

    end

    it "非ログインユーザー" do
      visit post_path(@post.id)
      expect(page).to have_selector '#comments'
      expect(page).not_to have_selector '#comment_form'
    end
  end
end
