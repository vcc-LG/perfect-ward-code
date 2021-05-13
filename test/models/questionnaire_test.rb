require 'test_helper'

class QuestionnaireTest < ActiveSupport::TestCase
  test 'score' do
    questionnaire = questionnaires(:questionnaire_1)

    candidate_1 = candidates(:leo)
    expected_score = 100 * (1.0 / 4.0)
    assert_equal expected_score, questionnaire.score(candidate: candidate_1)

    candidate_2 = candidates(:hannah)
    expected_score = 100 * (4.0 / 4.0)
    assert_equal expected_score, questionnaire.score(candidate: candidate_2)
  end
end
