module Web::Controllers::Bookie
  class Index
    include Web::Action

    def call(params)
    end

    private

    def current_user
      user_repository.first
    end

    def user_repository
      @repo = UserRepository.new
    end
  end
end
