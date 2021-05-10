class Candidate < ApplicationRecord
  has_many :responses, dependent: :destroy

  has_many :sections, through: :responses
  has_many :questions, through: :sections
  has_many :questionnaires, through: :sections

  validates :name, presence: true
end
