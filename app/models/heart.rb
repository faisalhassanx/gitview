class Heart < ApplicationRecord
  belongs_to :developer
  belongs_to :project
  
  validates_uniqueness_of :developer, scope: :project
end