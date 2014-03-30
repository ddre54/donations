require 'spec_helper'

describe "donations/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Jhon Doe",
      :email => "user@example.com"
    ))

    @donation = assign(:donation, stub_model(Donation,
      :title => "One donation",
      :description => "donation description"
    ))
  end

  it "renders edit donation form" do
    render
    assert_select "form[action=?][method=?]", user_donation_path(@user, @donation), "post" do
      assert_select "input#donation_title[name=?]", "donation[title]"
      assert_select "textarea#donation_description[name=?]", "donation[description]"
    end
  end

  describe "partial forms" do
    context "experience form" do
      before(:each) do
        @donable = assign(:donable, stub_model(Experience,
          :primary_contact_name => "Contact me",
          :latitude => 32.3232,
          :longitude => 45.4545
        ))
      end

      it "renders experience form" do
        render :partial => "donations/donables/experience_form", :locals => {:donable => @donable}
        assert_select "input#experience_primary_contact_name[name=?]", "experience[primary_contact_name]"
        assert_select "input#experience_latitude[name=?]", "experience[latitude]"
        assert_select "input#experience_longitude[name=?]", "experience[longitude]"
      end
    end

    context "physical item form" do
      before(:each) do
        @donable = assign(:donable, stub_model(PhysicalItem,
          :height => 61,
          :weight => 51,
          :width => 81
        ))
      end

      it "renders physical item form" do
        render :partial => "donations/donables/physical_item_form", :locals => {:donable => @donable}
        assert_select "input#physical_item_height[name=?]", "physical_item[height]"
        assert_select "input#physical_item_weight[name=?]", "physical_item[weight]"
        assert_select "input#physical_item_width[name=?]", "physical_item[width]"
      end
    end

    context "voucher form" do
      before(:each) do
        @donable = assign(:donable, stub_model(Voucher,
          :expiration_date => "2014-04-06"
        ))
      end

      it "renders voucher form" do
        render :partial => "donations/donables/voucher_form", :locals => {:donable => @donable}
        assert_select "input#voucher_expiration_date[name=?]", "voucher[expiration_date]"
      end
    end
  end
end
