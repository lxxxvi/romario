# frozen_string_literal: true

require_relative '../../spec_helper'

describe MatchRepository do
  subject { described_class.new }

  before do
    # TODO: create test data
  end

  it 'fetches all matches with predictions' do
    user_predictions = repository.with_predictions_of_user(user)
    expect(user_predictions.count).to eq 1
  end
end
