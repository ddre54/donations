require 'spec_helper'

describe "Users" do
  describe "signup" do
    it "creates new user" do
      expect {
        visit signup_path
        fill_in "Name", with: "Jhon Doe"
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "examplepass"
        fill_in "Password confirmation", with: "examplepass"
        click_button "Save"
      }.to change(User, :count).by(1)
    end
  end

  describe "GET /users" do
    describe "no valid session" do
      it "redirects with no signin user" do
        visit users_path
        expect(page).to have_text("Please log in")
      end
    end
  end
end
