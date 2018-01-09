class GroupRepository < Hanami::Repository
  associations do
    has_many :teams
  end

  def find_by_letter(letter)
    groups.where(letter: letter).limit(1).one
  end

  def find_or_create_by_letter!(letter)
    found = groups.where(letter: letter).limit(1).one

    unless found
      create(Group.new(letter: letter))
    end
  end
end
