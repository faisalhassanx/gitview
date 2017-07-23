class Type < ApplicationRecord
  validates :name, presence: true, length: { in: 3..20 }
  validates_uniqueness_of :name
end