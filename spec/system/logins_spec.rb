# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Logins', type: :system do
  let(:user) { create(:suzuki) }

  describe 'Visit' do
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
