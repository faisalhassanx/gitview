class Comment < ApplicationRecord
  validates :description, presence: true, length: { in: 4..140 }
  
  belongs_to :developer
  belongs_to :project
  
  validates :developer_id, presence: true
  validates :project_id, presence: true
  
  default_scope -> { order(updated_at: :desc) }
  
end