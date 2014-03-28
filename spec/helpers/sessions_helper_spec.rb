require 'spec_helper'

describe SessionsHelper do
  it "tells if there is a session authenticated" do
    session[:user_id] = 1
    helper.session_authenticated?.should be_true
  end
end
