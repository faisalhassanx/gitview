class Project < ApplicationRecord
  VALID_URL_REGEX = /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i
  
  validates :name,    presence: true, length: { maximum: 35 }
  validates :tagline, presence: true,  length: { maximum: 80 }
  validates :description, presence: true, length: { within: 100..1000 }
  validates :link, presence: true, length: { maximum: 50 }, format: { with: VALID_URL_REGEX }
  validates :github, length: { maximum: 50 }, format: { with: VALID_URL_REGEX }
  validates :developer_id, presence: true
  
  belongs_to :developer
  has_one :project_type
  has_one :type, through: :project_type, dependent: :destroy
  has_many :project_technologies
  has_many :technologies, through: :project_technologies, dependent: :destroy
  
  default_scope -> { order(updated_at: :desc) }
end