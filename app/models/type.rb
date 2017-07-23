class Type < ApplicationRecord
  validates :name, presence: true, length: { in: 3..20 }
  validates_uniqueness_of :name
  
  has_many :project_types
  has_many :projects, through: :project_types
end