module Web::Controllers::Bookie
  class Index
    include Web::Action

    expose :matches

    def call(_params)
      @matches = match_repository.with_predictions_of_user(current_user)
    end

    private

    def current_user
      user_repository.first
    end

    def user_repository
      @user_repo ||= UserRepository.new
    end

    def match_repository
      @match_repository ||= MatchRepository.new
    end
  end
end
