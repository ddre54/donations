require 'spec_helper'

feature "Authentication" do
  describe "signin page" do
    before do
      visit signin_path
    end

    it "have sign in" do
      page.should have_content('Sign in')
    end

    it "have sign in" do
      page.should have_title('Sign in')
    end

    describe "signin" do
      scenario "sign in with valid user" do
        user = signin
        expect(page).to have_text("Signin successful")
      end

      scenario "with invalid user" do
        click_button "Sign in"
        page.should have_selector('div.alert.alert-error')
      end
    end
  end
end
