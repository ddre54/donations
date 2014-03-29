# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :physical_donation, class: "Donation" do
    title "Physical Donation"
    description "A good item"
    association :donable, :factory => :physical_item
    # other attributes for physical_item model
  end

  factory :voucher_donation, class: "Donation" do
    title "Voucher Donation"
    description "A good voucher"
    association :donable, :factory => :voucher
  end

  factory :experience_donation, class: "Donation" do
    title "Experience Donation"
    description "A good experience"
    association :donable, :factory => :experience
  end
end
