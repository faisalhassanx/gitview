class Project < ApplicationRecord
  VALID_URL_REGEX = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
  
  validates :name,    presence: true, length: { maximum: 35 }
  validates :tagline, presence: true,  length: { maximum: 80 }
  validates :description, presence: true, length: { within: 100..1000 }
  validates :link, presence: true, length: { maximum: 50 }, format: { with: VALID_URL_REGEX }
  validates :github, length: { maximum: 50 }, format: { with: VALID_URL_REGEX }
end