class Voucher < ActiveRecord::Base
  has_one :donation, as: :donable

  validates :expiration_date, presence: true
end
