require 'spec_helper'

describe 'ActiveRecordExtensions' do
  it "gives the polymorphic assossiations of a model" do
    Donation.all_polymorphic_types(:donable).should eq(["Experience", "PhysicalItem", "Voucher"])
  end

  it "gives empty record when no polymorphic assossiations" do
    Donation.all_polymorphic_types(:invalid).should eq([])
  end
end
