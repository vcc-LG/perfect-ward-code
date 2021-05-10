class Question < ApplicationRecord
  has_many :sections
  has_many :questionnaires, through: :sections
end
