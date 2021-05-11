require 'test_helper'

class QuestionnaireTest < ActiveSupport::TestCase
  test 'fixture' do
    assert_equal 1, Questionnaire.count
  end

  test 'candidate_response?' do
    candidate = candidates(:leo)
    questionnaire = questionnaires(:questionnaire_1)
    assert_equal true, questionnaire.candidate_response?(candidate)
  end

  test 'score' do
    questionnaire = questionnaires(:questionnaire_1)

    candidate_1 = candidates(:leo)
    expected_score = 100 * (1.0 / 4.0)
    assert_equal expected_score, questionnaire.score(candidate_1)

    candidate_2 = candidates(:hannah)
    expected_score = 100 * (4.0 / 4.0)
    assert_equal expected_score, questionnaire.score(candidate_2)
  end
end
