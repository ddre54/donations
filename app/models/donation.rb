class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :donable, polymorphic: true, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 150 }
end
