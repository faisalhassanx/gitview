class Type < ApplicationRecord
  validates :name, presence: true, length: { in: 3..20 }
  validates_uniqueness_of :name
  
  has_one :project_type
  has_one :project, through: :project_type
end