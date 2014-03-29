class Voucher < ActiveRecord::Base
  TYPE = "Voucher"
  has_one :donation, as: :donable
end
