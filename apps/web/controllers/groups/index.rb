module Web::Controllers::Groups
  class Index
    include Web::Action

    expose :groups

    def call(params)
      @groups = GroupRepository.new.all
    end
  end
end
