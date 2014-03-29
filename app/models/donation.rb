class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :donable, polymorphic: true
end
