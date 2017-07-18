class Project < ApplicationRecord
  validates :name,    presence: true, length: { maximum: 35 }
  validates :tagline, presence: true,  length: { maximum: 80 }
  validates :description, presence: true, length: { within: 100..1000 }
  validates :link, presence: true, length: { maximum: 50 }
  validates :github, length: { maximum: 50 }
end