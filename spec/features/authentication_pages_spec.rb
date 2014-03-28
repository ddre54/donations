require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before do
      @user = create(:user)
      visit signin_path
    end

    it "have sign in" do
      subject.should have_content('Sign in')
    end

    it "have sign in" do
      subject.should have_title('Sign in')
    end

    describe "signin" do
      it "sign in with valid user" do
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "examplepass"
        click_button "Sign in"

        expect(subject).to have_text("Signin successful")
      end

      it "give error alert with invalid user" do
        click_button "Sign in"
        subject.should have_selector('div.alert.alert-error')
      end
    end
  end
end
