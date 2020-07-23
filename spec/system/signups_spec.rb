require 'rails_helper'

RSpec.describe "Signups", type: :system, js: true do

  # ユーザー登録ページ
  describe 'visit' do
    it 'signup page' do
        visit signup_path
        expect(page).to have_text('Sign up')
        expect(page).to have_text('Sign up with E-mail')
        expect(page).to have_text('Sign up with Twitter')
        expect(page).to have_text('Sign up with Facebook')
        expect(page).to have_text('Login is here')
        expect(page).to have_text('Login')
    end
  end

  describe 'controll' do
    # 新規ユーザーの作成に成功
    it 'is success that Creating new user' do
      visit signup_registration_path
      fill_in 'Name', with: 'name'
      fill_in 'E-mail', with: 'shitsumonwa@example.com'
      fill_in 'Country', with: 'japan'
      fill_in 'Password', with: '1234abcd'
      fill_in 'Password(confirmation)', with: '1234abcd'
      expect do
        click_on 'Register'
        expect(page).to have_content 'Please activate & check your email'
        expect(current_path).to eq root_path
      end.to change(User, :count).by 1
      
      created_user = User.last
      expect(created_user.name).to eq 'name'
      expect(created_user.email).to eq 'shitsumonwa@example.com'
      
      # 作成直後でメールアクティベーションが済んでいないため、パスワード関連の項目はnilになる
      expect(created_user.password).to eq nil
      expect(created_user.password_confirmation).to eq nil
    end

      # 新規ユーザーの作成に失敗
    it 'is fail that Creating new user' do
        visit signup_registration_path
        fill_in 'Name', with: 'name'
        fill_in 'E-mail', with: 'shitsumonwa@example.com'
        fill_in 'Country', with: 'japan'
        fill_in 'Password', with: '1234abcd'
        fill_in 'Password(confirmation)', with: ""
        expect do
          click_on 'Register'  
          expect(page).to have_content 'Signup fail'
          expect(current_path).to eq signup_create_path
        end.to change(User, :count).by 0
    end
  end

  describe 'error_messages' do

    # エラーメッセージの出力を確認する
    it 'is error messages are displayed ' do
      visit signup_registration_path
      fill_in 'Name', with: ""
      fill_in 'E-mail', with: ""
      fill_in 'Country', with: ""
      fill_in 'Password', with: ""
      fill_in 'Password(confirmation)', with: ""
      click_button 'Register' 
      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Nationality can't be blank"
      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "Password can't be blank"
      expect(page).to have_content "Password is too short (minimum is 6 characters)"
      expect(page).to have_content "Password confirmation can't be blank"
    end
  end
end