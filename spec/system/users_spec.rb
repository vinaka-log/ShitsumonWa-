require 'rails_helper'

RSpec.describe User, type: :system, js: true do

  let(:user){create(:suzuki)}

    before do
      visit login_path
      fill_in 'E-mail', with: user.email, match: :first
      fill_in 'Password', with: 'suzuki1234'
      within '.login-form' do
      click_on 'Log in'
      end
    end

# ユーザー一覧ページ
  describe 'Visit index' do
    it 'index page' do
       visit users_path
       expect(page).to have_text('User list')
    end
  end

# ユーザー編集ページ
  describe 'Visit edit' do
    it 'edit page', use_truncation: false do
       visit edit_user_path(user.id)
       expect(page).to have_text('Update your info')
       expect(page).to have_text('Name')
       expect(page).to have_text('E-mail')
       expect(page).to have_text('Country')
       expect(page).to have_text('Password')
       expect(page).to have_text('Password(confirmation)')
       expect(page).to have_text('SNS URL')
       expect(page).to have_text('(Optional)')
       expect(page).to have_text('Twitter URL')
       expect(page).to have_text('Facebook URL')
       expect(page).to have_text('Instagram URL')
       expect(page).to have_button('Update')
    end

    it 'edit profile', use_truncation: false do
      visit edit_user_path(user.id)
      fill_in 'Name', with: 'suzuki2'
      fill_in 'E-mail', with: 'suzuki2@example.com'
      fill_in 'Country', with: 'brazil'
      fill_in "Password", with: "suzuki21234"
      fill_in "Password(confirmation)", with: "suzuki21234"
      fill_in "Twitter URL", with: "https://twitter.com/test_user"
      fill_in "Facebook URL", with: "https://www.facebook.com/profile.php?id=1222231321415112&fref=pymk_rhc"
      fill_in "Instagram URL", with: "https://www.instagram.com/testuser/?hl=ja"
      click_button 'Update'
      
      expect(page).to have_text 'Update success'
      expect(current_path).to eq user_path(user.id)
    end 
  end
end

# validationは別