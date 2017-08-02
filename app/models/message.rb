class Message < ApplicationRecord
  belongs_to :developer
  
  validates :content, presence: true
  validates :developer_id, presence: true
end