require 'rails_helper'

RSpec.describe User, type: :system do

  before do
    @user = FactoryBot.create(:user)
    visit login_path
    fill_in 'E-mail', with: 'testr@example.com', match: :first
    fill_in 'Password', with: 'pass12345', match: :first
    click_button 'Log in'
    visit edit_user_path(@user.id)
  end

  it "Edit your profile" do
    fill_in 'Name', with: 'Test User'
    fill_in 'E-mail', with: 'user@example.com'
    fill_in 'Country', with: 'egypt'
    fill_in 'Password', with: 'password'
    fill_in 'Password(confirmation)', with: 'password'
    fill_in "Twitter URL", with: "https://twitter.com/test_user"
    fill_in "Facebook URL", with: "https://www.facebook.com/profile.php?id=1222231321415112&fref=pymk_rhc"
    fill_in "Instagram URL", with: "https://www.instagram.com/testuser/?hl=ja"

    click_button 'Update'

    expect(page).to have_content 'Update success'
  end
end