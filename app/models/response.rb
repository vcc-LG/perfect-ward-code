class Response < ApplicationRecord
  belongs_to :candidate
  belongs_to :section
  has_one :questionnaire, through: :section
  has_one :question, through: :section
end
