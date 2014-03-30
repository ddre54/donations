require 'spec_helper'

describe DonationsHelper do
  it "gives the donable type names" do
    expect(helper.donable_type_names).to eq([
      ["Experience", "Experience"],
      ["Physical Item", "PhysicalItem"],
      ["Voucher", "Voucher"]
    ])
  end

  it "gives the form based on the class name" do
    expect(helper.donable_class_name_form("PhysicalItem")).to eq("donations/donables/physical_item_form")
  end

  it "gives the show vies based on the class name" do
    expect(helper.donable_class_name_show("PhysicalItem")).to eq("donations/donables/physical_item_show")
  end
end
