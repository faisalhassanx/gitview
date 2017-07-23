class Type < ApplicationRecord
  validates :name, presence: true, length: { in: 6..20 }
  validates_uniqueness_of :name
end