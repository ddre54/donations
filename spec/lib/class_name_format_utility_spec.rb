require 'spec_helper'

describe ClassNameFormatUtility do
  let(:class_with_utility_module) {
    Class.new do
      include ClassNameFormatUtility
    end
  }

 subject { class_with_utility_module.new }

  it "format string to class name" do
    subject.string_to_class_name("Physical Item").should eq("PhysicalItem")
    subject.string_to_class_name("Physical item").should eq("PhysicalItem")
    subject.string_to_class_name("physical item").should eq("PhysicalItem")
    subject.string_to_class_name("physical_item").should eq("PhysicalItem")
    subject.string_to_class_name("Physical Item").should eq("PhysicalItem")
    subject.string_to_class_name("PhysicalItem").should eq("PhysicalItem")
  end

  it "format class name to human readable" do
    subject.class_name_to_human_readable("PhysicalItem").should eq("Physical Item")
  end
end
