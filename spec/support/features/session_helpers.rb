module Features
  module SessionHelpers
    def signup_with(name, email, password)
      visit signup_path
      fill_in "Name", with: name
      fill_in "Email", with: email
      fill_in "Password", with: password
      fill_in "Password confirmation", with: password
      click_button "Save"
    end

    def signin
      user = create(:user)
      visit signin_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
      user
    end
  end
end
