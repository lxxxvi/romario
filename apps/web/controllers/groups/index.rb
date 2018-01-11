module Web::Controllers::Groups
  class Index
    include Web::Action

    expose :groups

    def call(params)
      @groups = GroupRepository.new.ordered_by_name
    end
  end
end
