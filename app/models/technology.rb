class Technology < ApplicationRecord
  validates :name, presence: true, length: { in: 2..25 }
  validates_uniqueness_of :name
  
  has_many :project_technologies
  has_many :projects, through: :project_technologies
end