require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
    test 'total_average_score' do
        questionnaire = questionnaires(:questionnaire_1)
        candidate_1 = candidates(:leo)

        expected_score_1 = 100 * (1.0 / 4.0)
        expected_score_2 = 100 * (4.0 / 4.0)
        expected_total_average_score = [expected_score_1,expected_score_2].sum(0.0)/2

        assert_equal expected_total_average_score, candidate_1.total_average_score
      end
end
