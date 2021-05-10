class Section < ApplicationRecord
  belongs_to :question
  belongs_to :questionnaire
end
