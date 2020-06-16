module LoginModule
  def login(@user)
    visit login_path
    fill_in 'E-mail', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end
end