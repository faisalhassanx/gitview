class Project < ApplicationRecord
  
  VALID_URL_REGEX = /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i
  
  validates :name,    presence: true, length: { maximum: 35 }
  validates :tagline, presence: true,  length: { maximum: 80 }
  validates :description, presence: true, length: { within: 100..1000 }
  validates :link, presence: true, length: { maximum: 50 }, format: { with: VALID_URL_REGEX }
  validates :github, length: { maximum: 50 }, format: { with: VALID_URL_REGEX }
  validates :developer_id, presence: true
  validate :picture_size
  
  belongs_to :developer
  has_many :hearts, dependent: :destroy
  has_many :project_types
  has_many :types, through: :project_types, dependent: :destroy
  has_many :project_technologies
  has_many :technologies, through: :project_technologies, dependent: :destroy
  has_many :comments, dependent: :destroy
  default_scope -> { order(updated_at: :desc) }
  
  mount_uploader :picture, PictureUploader
  
  def hearts_total
    self.hearts.where(heart: true).size
  end
  
  def unhearts_total
    self.hearts.where(heart: false).size
  end
  
  private
  
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "Should be less than 5MB")
    end
  end
  
end