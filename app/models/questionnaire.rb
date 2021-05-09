class Questionnaire < ApplicationRecord
  has_many :responses
  has_many :questions
end
