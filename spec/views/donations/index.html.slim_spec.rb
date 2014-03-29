require 'spec_helper'

describe "donations/index" do
  before(:each) do
    assign(:user, [
      stub_model(User,
        :name => "Jhon Doe",
        :email => "user@example.com"
      )
    ])

    assign(:donations, [
      stub_model(Donation,
        :title => "Donation 1",
        :description => "Description for donation 1"
      ),
      stub_model(Donation,
        :title => "Donation 1",
        :description => "Description for donation 1"
      )
    ])
  end

  it "renders a list of donations" do
    render
    assert_select "tr>td", :text => "Donation 1".to_s, :count => 2
    assert_select "tr>td", :text => "Description for donation 1".to_s, :count => 2
  end
end
