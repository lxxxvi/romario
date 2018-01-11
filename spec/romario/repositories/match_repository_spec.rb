# frozen_string_literal: true

require_relative '../../spec_helper'

describe MatchRepository do
  subject { described_class.new }

  let(:user) { UserRepository.new.first }

  before do
    # TODO: create test data
  end

  it 'fetches all matches with predictions' do
    user_predictions = subject.with_predictions_of_user(user)
    expect(user_predictions.count).to eq 44
  end
end
