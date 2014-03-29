class Experience < ActiveRecord::Base
  TYPE = "Experience"
  has_one :donation, as: :donable
end
