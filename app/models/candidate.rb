class Candidate < ApplicationRecord
  has_many :responses, dependent: :destroy

  has_many :sections, through: :responses
  has_many :questions, through: :sections
  has_many :questionnaires, through: :sections

  validates :name, presence: true

  def total_average_score
    scores = []
    self.questionnaires.uniq.each do |q|
      score = q.score(candidate: self)
      scores << q.score(candidate: self) if score.present?
    end
    scores.sum(0.0)/scores.size
  end
end
