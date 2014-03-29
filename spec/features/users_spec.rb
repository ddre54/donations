require 'spec_helper'

feature "Users" do
  describe "signup" do
    scenario "with valid information creates new user" do
      expect {
        signup_with("Jhon Doe", "user@example.com", "examplepass")
      }.to change(User, :count).by(1)
    end
  end

  describe "profile page" do
    scenario "with valid signin information" do
      user = signin
      expect(page).to have_text("Name:#{user.name}")
      expect(page).to have_text("Email:#{user.email}")
      expect(page).to have_text("Donations")
    end
  end

  describe "signin" do
    scenario "with invalid signin information" do
      visit users_path
      expect(page).to have_text("Please sign in")
    end
  end
end
