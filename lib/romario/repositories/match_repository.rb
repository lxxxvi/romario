class MatchRepository < Hanami::Repository

  associations do
    has_many :predictions
  end

  def with_predictions_of_user(user)
    sql = with_predictions_of_user_sql(user.id)
    matches.read(sql).call.collection
    # left_joins(:predictions).where(prediction: { user_id: ? })
  end

  private

  def with_predictions_of_user_sql(user_id)
    <<-EOF
      SELECT *
        FROM matches m
        LEFT OUTER JOIN predictions p    ON p.match_id = m.id
                                        AND p.user_id = #{user_id}
    EOF
  end
end
