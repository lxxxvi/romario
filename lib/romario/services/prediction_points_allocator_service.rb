class PredictionPointsAllocatorService
  CORRECT_TEAM_SCORE_POINTS = 2
  CORRECT_OUTCOME_POINTS = 5
  CORRECT_GOAL_DIFFERENCE_POINTS = 1
  ZERO_POINTS = 0

  attr_reader :prediction
  attr_reader :match
  attr_reader :prediction_repository

  def initialize(prediction)
    @prediction = prediction
    @match_repository = MatchRepository.new
    @match = @match_repository.find(@prediction.match_id)
  end

  def allocate_points
    if point_allocation_possible?
      
    end
  end

  # private

  def left_team_score_points
    return CORRECT_TEAM_SCORE_POINTS if left_team_score_correct?
    ZERO_POINTS
  end

  def right_team_score_points
    return CORRECT_TEAM_SCORE_POINTS right_team_score_correct?
    ZERO_POINTS
  end

  def outcome_points
    return CORRECT_OUTCOME_POINTS if outcome_correct?
    ZERO_POINTS
  end

  def goal_difference_points
    return CORRECT_GOAL_DIFFERENCE_POINTS if goal_difference_correct?
    ZERO_POINTS
  end

  private

  def point_allocation_possible?
    !match.left_team_score.nil? && 
    !match.right_team_score.nil?
  end

  def left_team_score_correct?
    match.left_team_score == prediction.predicted_left_team_score
  end

  def right_team_score_correct?
    match.right_team_score == prediction.predicted_right_team_score
  end

  def outcome_correct?
    actual_outcome    = outcome_for(match.left_team_score, match.right_team_score)
    predicted_outcome = outcome_For(prediction.left_team_score, prediction.right_team_score)

    (actual_outcome == predicted_outcome)
  end

  def goal_difference_correct?
    actual_goal_difference    = goal_difference_for(match.left_team_score, match.right_team_score)
    predicted_goal_difference = goal_difference_for(prediction.predicted_left_team_score, prediction.predicted_right_team_score)

    (actual_goal_difference == predicted_goal_difference)
  end

  def outcome_for(left_team_score, right_team_score)
    return :left_team_wins  if left_team_score > right_team_score
    return :right_team_wins if left_team_score < right_team_score
    :draw
  end

  def goal_difference_for(left_team_score, right_team_score)
    left_team_score - right_team_score
  end
end
