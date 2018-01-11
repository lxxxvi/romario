require_relative '../../spec_helper'

describe MatchRepository do

  let(:repository) { MatchRepository.new }

  before do
    # todo create test data
  end

  it 'fetches all matches with predictions' do
    user_predictions = repository.with_predictions_of_user(user)
    user_predictions.count.must_equal 1
  end
end
