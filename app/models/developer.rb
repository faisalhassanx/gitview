class Developer < ApplicationRecord
  before_save { self.email = email.downcase }
  
  VALID_URL_REGEX = /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  
  validates :name, presence: true,  length: { maximum: 60 }
  validates :email, presence: true, length: { maximum: 100 }, 
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { in: 6..15 }, allow_nil: true
  validates :website, length: { maximum: 50 }, format: { with: VALID_URL_REGEX }, allow_nil: true
  validates :github, length: { maximum: 50 }, format: { with: VALID_URL_REGEX }, allow_nil: true
  
  has_many :projects, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  has_secure_password
  
  default_scope -> { order(created_at: :asc) }
end