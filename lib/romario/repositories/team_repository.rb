class TeamRepository < Hanami::Repository
  associations do
    belongs_to :group
  end

  def find_or_initialize_by_fifa_country_code(fifa_country_code)
    found = teams.where(fifa_country_code: fifa_country_code).limit(1).one

    found || Team.new(fifa_country_code: fifa_country_code)
  end

  def create_or_update!(team)
    if team.id
      update(team.id, team)
    else
      create(fifa_country_code: team.fifa_country_code, name: team.name, group_id: team.group_id)
    end
  end
end
