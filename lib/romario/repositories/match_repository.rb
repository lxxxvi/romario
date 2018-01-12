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

  def by_phase_and_teams(phase, left_team, right_team)
    matches
      .where(phase: phase, left_team_id: left_team.id, right_team_id: right_team.id).call.first
  end

  def team_repository
    @team_repository ||= TeamRepository.new
  end
end
