# frozen_string_literal: true

class MatchRepository < Hanami::Repository
  associations do
    has_many :predictions
  end

  def with_predictions_of_user(user)
    matches
      .left_join(predictions, match_id: :id)
      .where('predictions.user_id = ?', user.id)
      .order(:kickoff_at)
      .call
      .collection
  end
end
