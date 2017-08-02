class Message < ApplicationRecord
  belongs_to :developer
  
  validates :content, presence: true
  validates :developer_id, presence: true
  
  def self.most_recent
    order(:created_at).last(25)
  end
end