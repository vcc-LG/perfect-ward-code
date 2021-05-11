require 'test_helper'

class ResponsesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_response_path(questionnaire_id: questionnaires(:questionnaire_1).id)
    assert_response :success
  end

  test 'should redirect for valid post' do
    post '/responses',
         params: { response: { candidate_id: candidates(:leo).id,
                               section_id: { "#{sections(:section_1).id}": 'true' } } }
    assert_redirected_to questionnaires_path
  end
end
