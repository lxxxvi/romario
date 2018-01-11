class GroupRepository < Hanami::Repository
  associations do
    has_many :teams
  end

  def ordered_by_name
    groups.order(:name).call.collection
  end

  def by_name(name)
    groups.where(name: name)
  end
end
