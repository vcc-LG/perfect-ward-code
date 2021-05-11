class Questionnaire < ApplicationRecord
  has_many :sections, dependent: :destroy
  has_many :questions, through: :sections

  def candidate_response?(candidate)
    Response.joins(:section).where(candidate: candidate, section: { questionnaire: self }).any?
  end

  def score(candidate)
    responses = Response.joins(:questionnaire).where(section: { questionnaire: self },
                                                     candidate: candidate).pluck(:value)
    100 * (responses.count(true).to_f / responses.count.to_f)
  end
end
