class ResponsesController < ApplicationController
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
    @candidate = Candidate.where(id: response_params[:candidate_id])
    render :new if @candidate.nil?

    responses = []
    response_params[:section_id].each do |s_id, s_value|
      @existing_response = Response.where(candidate: @candidate, section_id: s_id)
      @existing_response.destroy_all if @existing_response.present?

      responses << Response.new(section_id: s_id, value: s_value, candidate_id: @candidate.first.id)
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
end
