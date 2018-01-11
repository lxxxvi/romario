# frozen_string_literal: true

require_relative '../../spec_helper'

describe MatchRepository do
  subject { described_class.new }

  let(:user) { UserRepository.new.first }

  before do
    # TODO: create test data
  end

  it 'fetches all matches with predictions and teams' do
    user_predictions = subject.with_predictions_of_user(user)
    expect(user_predictions.count).to eq 47
    prediction = user_predictions.first
    expect(prediction.left_team).to be
    expect(prediction.right_team).to be
  end
end
