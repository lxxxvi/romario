class PredictionRepository < Hanami::Repository

  def by_match_of_user(user, match)
    predictions
      .where(user_id: user.id, match_id: match.id)
      .one
  end
end
