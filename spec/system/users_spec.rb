require 'rails_helper'

RSpec.describe User, type: :system do

  before do
    @user = FactoryBot.create(:user)
    sign_in @user
    visit edit_user_path(@user.id)
  end

  it "Edit your profile" do
    attach_file('image-form', image)
    fill_in 'Name', with: 'Test User'
    fill_in 'E-mail', with: 'user@example.com'
    fill_in 'Country', with: 'egypt'
    fill_in 'Password', with: 'password'
    fill_in 'Password_confoimation', with: 'password'
    fill_in "TwitterURL", with: "https://twitter.com/test_user"
    fill_in "FacebookURL", with: "https://www.facebook.com/profile.php?id=1222231321415112&fref=pymk_rhc"
    fill_in "InstagramURL", with: "https://www.instagram.com/testuser/?hl=ja"

    click_button 'Update'

    expect(page).to have_content 'Update success'
  end
end