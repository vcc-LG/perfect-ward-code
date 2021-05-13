class QuestionnairesController < ApplicationController
  def index
    @questionnaires = Questionnaire.order(:title)
    @candidates = Candidate.order(:name)
  end
end
