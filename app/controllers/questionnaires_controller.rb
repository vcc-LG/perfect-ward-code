class QuestionnairesController < ApplicationController
  def index
    @questionnaires = Questionnaire.all
    @candidates = Candidate.all
  end
end
