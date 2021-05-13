class Questionnaire < ApplicationRecord
  has_many :sections, dependent: :destroy
  has_many :questions, through: :sections

  def score(candidate:)
    responses = Response.joins(:questionnaire).where(section: { questionnaire: self },
                                                     candidate: candidate).pluck(:value)

    return nil if responses.empty?

    100 * (responses.count(true).to_f / responses.count.to_f)
  end
end
