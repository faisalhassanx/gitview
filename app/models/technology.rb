class Technology < ApplicationRecord
  validates :name, presence: true, length: { in: 2..25 }
  validates_uniqueness_of :name
end