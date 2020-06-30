require 'rails_helper'

RSpec.describe User, type: :system do

  # ユーザー登録ページ
  describe 'Visit' do
    it 'Signup page' do
        visit signup_path
        expect(page).to have_text('Sign up')
        expect(page).to have_text('Sign up with E-mail')
        expect(page).to have_text('Sign up with Twitter')
        expect(page).to have_text('Sign up with Slack')
        expect(page).to have_text('Login is here')
        expect(page).to have_text('Login')
    end
  end

  describe 'Controll' do

    # E-mailで新規ユーザーの作成に成功
    it 'is success that Creating new user with E-mail' do
      visit signup_registration_path
      fill_in 'Name', with: 'name'
      fill_in 'E-mail', with: 'shitsumonwa@example.com'
      fill_in 'Country', with: 'japan'
      fill_in 'Password', with: '1234abcd'
      fill_in 'Password(confirmation)', with: '1234abcd'
      expect do
        click_on 'Register'
        expect(page).to have_content 'Signup success & please activate'
        expect(current_path).to eq root_path
      end.to change(User, :count).by 1
      
      created_user = User.last
      expect(created_user.name).to eq 'name'
      expect(created_user.email).to eq 'shitsumonwa@example.com'
      
      # 作成直後でメールアクティベーションが済んでいないため、パスワード関連の項目はnilになるはず
      expect(created_user.password).to eq nil
      expect(created_user.password_confirmation).to eq nil
    end

    # E-mailで新規ユーザーの作成に失敗
    it 'is fail that Creating new user with E-mail' do
        visit signup_registration_path
        fill_in 'Name', with: 'name'
        fill_in 'E-mail', with: 'shitsumonwa@example.com'
        fill_in 'Country', with: 'japan'
        fill_in 'Password', with: '1234abcd'
        expect do
          click_on 'Register'  
          expect(page).to have_content 'Signup failed'
          expect(current_path).to eq signup_create_path
        end.to change(User, :count).by 0
    end
  end
end