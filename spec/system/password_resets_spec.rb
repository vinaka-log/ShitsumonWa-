require 'rails_helper'

RSpec.describe "PasswordResets", type: :system do

  let(:user_a){create(:suzuki)}
  
  describe 'visit' do
    # パスワードリセットページ
    it 'password reset page' do
      visit login_path
      expect(page).to have_text('Forgot Password?')
      expect(page).to have_text('Email')
      expect(page).to have_button('Reset my password!')
    end
  end

  describe 'password reset mail' do
    
    # パスワード再設定手続きのメール送信に成功
    it 'sends password reset mail (valid email)' do
      visit login_path
      within '.field' do
        fill_in 'email', with: user_a.email
      end
        
      click_on 'Reset my password!'
      expect(current_path).to eq root_path 
      expect(page).to have_text('Instructions have been sent to your email')
    end

    # パスワード再設定手続きのメール送信に成功（存在しないメールアドレス）
    it "can't send password reset mail (invalid email)" do
      visit login_path
      
      within '.field' do
        fill_in 'email', with: 'tanaka@example.com'
      end
      click_on 'Reset my password!'
      expect(current_path).to eq password_resets_path
      expect(page).to have_text('Email address is wrong')
    end
  end


end

