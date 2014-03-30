class Experience < ActiveRecord::Base
  has_one :donation, as: :donable

  validates :primary_contact_name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
