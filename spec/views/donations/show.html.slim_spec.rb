require 'spec_helper'

describe "donations/show" do

  def create_donation_with_donable(donable)
    @donation = assign(:donation, stub_model(Donation,
      :title => "One donation",
      :description => "donation description",
      :donable => donable
    ))
  end

  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Jhon Doe",
      :email => "user@example.com"
    ))
  end

  describe "experience donable" do
    before(:each) do
      @donable = assign(:donable, stub_model(Experience,
        :primary_contact_name => "Contact me",
        :latitude => 32.3232,
        :longitude => 45.4545
      ))

      create_donation_with_donable(@donable)
    end

    it "renders attributes in <p>" do
      render
      rendered.should match(/One donation/)
      rendered.should match(/donation description/)
      rendered.should match(/Contact me/)
      rendered.should match(/32.3232/)
      rendered.should match(/45.4545/)
    end
  end

  describe "physical item donable" do
    before(:each) do
      @donable = assign(:donable, stub_model(PhysicalItem,
        :height => 61,
        :weight => 51,
        :width => 81
      ))

      create_donation_with_donable(@donable)
    end

    it "renders attributes in <p>" do
      render
      rendered.should match(/One donation/)
      rendered.should match(/donation description/)
      rendered.should match(/61/)
      rendered.should match(/51/)
      rendered.should match(/81/)
    end
  end

  describe "voucher donable" do
    before(:each) do
      @donable = assign(:donable, stub_model(Voucher,
        :expiration_date => "2014-04-06"
      ))

      create_donation_with_donable(@donable)
    end

    it "renders attributes in <p>" do
      render
      rendered.should match(/One donation/)
      rendered.should match(/donation description/)
      rendered.should match(/2014-04-06/)
    end
  end
end
