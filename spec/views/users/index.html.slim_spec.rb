require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :name => "Jhon Doe",
        :email => "user@example.com"
      ),
      stub_model(User,
        :name => "Jhon Doe",
        :email => "user@example.com"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Jhon Doe".to_s, :count => 2
    assert_select "tr>td", :text => "user@example.com".to_s, :count => 2
  end
end
