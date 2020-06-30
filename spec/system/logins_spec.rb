require 'rails_helper'

RSpec.describe "Logins", type: :system do

  before do
    @user = FactoryBot.create(:user)
  end
  
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
    
    # ログイン成功
    it 'is success that Creating new user with E-mail' do
      visit login_path
      fill_in 'E-mail', with: 'test@example.com',match: :first
      fill_in 'Password', with: 'test12345'
      within '.login-form' do
      click_button 'Log in'
      end
      
    end

    # ログイン失敗
    it 'is fail that Creating new user with E-mail' do
        create(:user)
        visit login_path
        fill_in 'E-mail', with: 'test1@example.com',match: :first
        fill_in 'Password', with: ''
        within '.login-form' do
        click_on 'Log in'
        end
        expect(page).to have_content 'login fail'
        expect(current_path).to eq login_pending_path
    end
  end
end