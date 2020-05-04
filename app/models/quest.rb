class Quest < ApplicationRecord
  validates :brandname, presence: true
  has_one :brand
end
