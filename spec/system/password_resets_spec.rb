require 'rails_helper'

RSpec.describe "PasswordResets", type: :system do
  
  describe 'visit' do
    # パスワードリセットページ
    it 'password reset page' do
      visit login_path
      expect(page).to have_text('Forgot Password?')
      expect(page).to have_text('Email')
      expect(page).to have_text('reset my password!')
    end
  end
  

end

