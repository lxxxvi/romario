class PredictionRepository < Hanami::Repository
  associations do
    belongs_to :match
  end

  def by_match_of_user(user, match)
    predictions
      .where(user_id: user.id, match_id: match.id)
      .one
  end

  def find_with_match(id)
    aggregate(:match).where(id: id).map_to(Prediction).one
  end
end
