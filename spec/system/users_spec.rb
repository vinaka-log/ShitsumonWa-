require 'rails_helper'

RSpec.describe User, type: :system do

  let(:user){create(:suzuki)}

  # ユーザー登録ページ
  describe 'Visit signup' do
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
          expect(page).to have_content 'Signup fail'
          expect(current_path).to eq signup_create_path
        end.to change(User, :count).by 0
    end
  end

  describe 'Visit login' do
    # ログインページ
    it 'Login page' do
      visit login_path
      expect(page).to have_text('Log in')
      expect(page).to have_text('Log in with Twitter')
      expect(page).to have_text('Log in with Slack')
      expect(page).to have_text('E-mail')
      expect(page).to have_text('Password')
      expect(page).to have_text('Log in')
      expect(page).to have_text('Forgot Password?')
      expect(page).to have_text('Email')
      expect(page).to have_text('Click here if you have not registered')
      expect(page).to have_text('Sign up')
    end
  end

  describe 'Controll' do
    context 'Login', use_truncation: false do
      # ログイン成功
      it 'is success that Creating new user with E-mail' do
        visit login_path
        fill_in 'E-mail', with: user.email, match: :first
        fill_in 'Password', with: 'suzuki1234'
        within '.login-form' do
          click_button 'Log in'
        end
        expect(page).to have_content 'Login success'
        expect(current_path).to eq user_path(user.id)
      end

      # ログイン失敗
      it 'is fail that Creating new user with E-mail' do
        visit login_path
        fill_in 'E-mail', with: 'test1@example.com', match: :first
        fill_in 'Password', with: ''
        within '.login-form' do
          click_on 'Log in'
        end
        expect(page).to have_content 'Login fail'
        expect(current_path).to eq login_pending_path
      end
    end
  end
end