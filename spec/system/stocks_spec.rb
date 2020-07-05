require 'rails_helper'

RSpec.describe "Stocks", type: :system, js: true do
  let(:user_a){create(:suzuki)}
  let(:user_b){create(:tanaka)}
  let!(:question_a) { FactoryBot.create(:question, name: 'first title', description: 'first content', user: user_a) }
  let!(:question_b) { FactoryBot.create(:question, name: 'second title', description: 'second content', user: user_b) }

  describe "visit new" do
    # ログイン済みかつ他の人の投稿のみストックボタンが出る
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
      expect(page).to have_css('.stock-change')  
    end
    #ログインしていないので、ストックボタンがでない
    it "not logged in user" do
      # 質問詳細画面
      visit question_path(id: question_a.id)
      expect(page).not_to have_css('.stock-change')  
    end
    #自身の投稿はストックボタンが出ない
    it "logged in user go to own question" do
      visit login_path
      fill_in 'E-mail', with: user_b.email, match: :first
      fill_in 'Password', with: 'tanaka1234'
      within '.login-form' do
      click_on 'Log in'
      end
      visit question_path(id: question_b.id)
      expect(page).not_to have_css('.stock-change')  
    end
  end
end
