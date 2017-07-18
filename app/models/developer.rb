class Developer < ApplicationRecord
  VALID_URL_REGEX = /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  
  validates :name, presence: true,  length: { maximum: 60 }
  validates :email, presence: true, length: { maximum: 100 }, 
                    format: { with: VALID_EMAIL_REGEX }
  validates :website, length: { maximum: 50 }, format: { with: VALID_URL_REGEX }
  validates :github, length: { maximum: 50 }, format: { with: VALID_URL_REGEX }
end