class PhysicalItem < ActiveRecord::Base
  TYPE = "Physical Item"
  has_one :donation, as: :donable
end
