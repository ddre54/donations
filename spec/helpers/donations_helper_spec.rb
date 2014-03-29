require 'spec_helper'

describe DonationsHelper do
  it "gives the donable type names" do
    expect(helper.donable_type_names).to eq(["Experience", "Physical Item", "Voucher"])
  end

  it "gives the model name as class name" do
    expect(helper.model_type_name_to_class_name("Physical Item")).to eq("PhysicalItem")
  end
end
