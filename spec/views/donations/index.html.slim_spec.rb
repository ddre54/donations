require 'spec_helper'

describe "donations/index" do

  def class_name_to_human_readable(donable_type)
    donable_type
  end

  before(:each) do
    assign(:user,
      stub_model(User,
        :name => "Jhon Doe",
        :email => "user@example.com"
      )
    )

    assign(:donations, [
      stub_model(Donation,
        :title => "Donation 1",
        :description => "Description for donation 1",
        :donable_type => "SomethingDonable"
      ),
      stub_model(Donation,
        :title => "Donation 1",
        :description => "Description for donation 1",
        :donable_type => "SomethingDonable"
      )
    ])
  end

  it "renders a list of donations" do
    render
    assert_select "h1", :text => "Jhon Doe's donations".to_s, :count => 1
    assert_select "tr>td", :text => "Donation 1".to_s, :count => 2
    assert_select "tr>td", :text => "Description for donation 1".to_s, :count => 2
  end
end
