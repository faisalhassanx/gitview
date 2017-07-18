class Project < ApplicationRecord
  validates :name, presence: true
  validates :tagline, presence: true
  validates :description, presence: true
  validates :link, presence: true
end