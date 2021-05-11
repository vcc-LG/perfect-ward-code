require 'test_helper'

class QuestionnairesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get questionnaires_path
    assert_response :success
  end
end
