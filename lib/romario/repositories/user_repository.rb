class UserRepository < Hanami::Repository
  associations do
    has_many :predictions
  end

  def with_predictions
    aggregate(:predictions).as(User)
  end
end
