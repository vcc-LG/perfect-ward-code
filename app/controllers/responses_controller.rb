class ResponsesController < ApplicationController

  def index
    if params[:candidate_id] and params[:questionnaire_id]
      @questionnaire = Questionnaire.find_by(id: params[:questionnaire_id])
      redirect_to questionnaires_path if @questionnaire.nil?

      @candidate = Candidate.find_by(id: params[:candidate_id])
      redirect_to questionnaires_path if @candidate.nil?

      @candidate_responses = candidate_questionnaire_responses(candidate_id: params[:candidate_id], questionnaire_id: params[:questionnaire_id])
      redirect_to questionnaires_path if @candidate_responses.nil?
    else
      redirect_to questionnaires_path
    end
  end

  def new
    if params[:questionnaire_id]
      @questionnaire = Questionnaire.find_by(id: params[:questionnaire_id])
      redirect_to questionnaires_path if @questionnaire.nil?

      @candidates = Candidate.all
    else
      redirect_to questionnaires_path
    end
  end

  def create
    @candidate = Candidate.find_by(id: response_params[:candidate_id])
    render :new if @candidate.nil?

    responses = []
    response_params[:section_id].each do |s_id, s_value|
      # Remove existing response to section
      Response.where(candidate: @candidate, section_id: s_id).destroy_all

      responses << Response.new(section_id: s_id, value: s_value, candidate_id: @candidate.id)
    end

    if responses.each(&:save)
      redirect_to questionnaires_path
    else
      render :new
    end
  end

  private

  def response_params
    params.require(:response).permit(:candidate_id, section_id: {})
  end

  def candidate_questionnaire_responses(candidate_id:, questionnaire_id:)
    Response.includes(:section).where(candidate_id: candidate_id, section: { questionnaire_id: questionnaire_id })
  end

end
