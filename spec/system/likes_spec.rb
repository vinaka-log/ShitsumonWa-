require 'rails_helper'

RSpec.describe "Likes", type: :system, js: true do 
  let(:user_a){create(:suzuki)}
  let(:user_b){create(:tanaka)}
  let!(:question_a) { FactoryBot.create(:question, name: 'first title', description: 'first content', user: user_a) }

  describe "controll(Ajax)" do
    # ログイン済みのユーザーならいいねができる
    it "logged in user" do
      # ログインする
      visit login_path
      fill_in 'E-mail', with: user_b.email, match: :first
      fill_in 'Password', with: 'tanaka1234'
      within '.login-form' do
      click_on 'Log in'
      end 
      # 質問一覧画面
      visit questions_path
      expect(page).to have_css('.like-button-off') 
      expect(page).not_to have_css('.like-button-on')
      expect {
        find('.like-button-off').click      
      }.to change{ question_a.likes.count }.by(1) 
    end 
  end
end