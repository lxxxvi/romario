# frozen_string_literal: true

class MatchRepository < Hanami::Repository
  associations do
    has_many :predictions
    belongs_to :team, as: :left_team, foreign_key: :left_team_id
    belongs_to :team, as: :right_team, foreign_key: :right_team_id
  end

  def with_predictions_of_user(user)
    aggregate(:left_team, :right_team)
      .left_join(predictions, match_id: :id)
      .where('predictions.user_id = ?', user.id)
      .order(:kickoff_at)
      .call
      .collection
  end

  def by_phase_and_country_codes(phase, left_team_country_code, right_team_country_code)
    left_team  = team_repository.by_fifa_country_code(left_team_country_code)
    right_team = team_repository.by_fifa_country_code(right_team_country_code)
    matches
      .where(phase: phase, left_team_id: left_team.id, right_team_id: right_team.id).call.first
  end

  def team_repository
    @team_repository ||= TeamRepository.new
  end
end
