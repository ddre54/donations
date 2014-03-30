class PhysicalItem < ActiveRecord::Base
  has_one :donation, as: :donable

  validates :height, presence: true, length: { maximum: 50 }
  validates :weight, presence: true
  validates :width, presence: true
end
