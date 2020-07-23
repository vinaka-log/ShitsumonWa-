# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Logins', type: :system, js: true do
  let(:user) { create(:suzuki) }

  describe 'visit login' do
    # ログインページ
    it 'Login page' do
      visit login_path
      expect(page).to have_text('Log in')
      expect(page).to have_text('Log in with Twitter')
      expect(page).to have_text('Log in with Facebook')
      expect(page).to have_text('E-mail')
      expect(page).to have_text('Password')
      expect(page).to have_text('Log in')
      expect(page).to have_text('Forgot Password?')
      expect(page).to have_text('Email')
      expect(page).to have_text('Click here if you have not registered')
      expect(page).to have_text('Sign up')
    end
  end

  describe 'controll' do
    context 'login', use_truncation: false do
      # ログイン成功
      it 'is success that Creating new user' do
        visit login_path
        fill_in 'E-mail', with: user.email, match: :first
        fill_in 'Password', with: 'suzuki1234'
        within '.login-btn' do
          click_on 'Log in'
        end
        expect(page).to have_content 'Login success'
        expect(current_path).to eq user_path(user.id)
      end

      # ログイン失敗
      it 'is fail that Creating new user with' do
        visit login_path
        fill_in 'E-mail', with: user.email, match: :first
        fill_in 'Password', with: ''
        within '.login-btn' do
          click_on 'Log in'
        end
        expect(page).to have_content 'Login fail'
        expect(current_path).to eq login_pending_path
      end
    end

    context 'logout', use_truncation: false do
      # ログアウト
      it 'is success that logout' do
        visit login_path
        fill_in 'E-mail', with: user.email, match: :first
        fill_in 'Password', with: 'suzuki1234'
        within '.login-btn' do
          click_on 'Log in'
        end
        click_on 'Log out'
        expect(page).to have_text 'Log out!'
        expect(current_path).to eq root_path
      end
    end
  end
end
