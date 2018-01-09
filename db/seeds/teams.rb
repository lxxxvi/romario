team_repository   = TeamRepository.new
group_repository  = GroupRepository.new

group_a = group_repository.find_by_letter('A')
group_b = group_repository.find_by_letter('B')
group_c = group_repository.find_by_letter('C')
group_d = group_repository.find_by_letter('D')
group_e = group_repository.find_by_letter('E')
group_f = group_repository.find_by_letter('F')
group_g = group_repository.find_by_letter('G')
group_h = group_repository.find_by_letter('H')

teams = {
  rus: [group_a, 'Russia'],
  ksa: [group_a, 'Saudi Arabia', 'KSA'],
  egy: [group_a, 'Egypt'],
  uru: [group_a, 'Uruguay'],

  por: [group_b, 'Portugal'],
  esp: [group_b, 'Spain'],
  mar: [group_b, 'Morocco'],
  irn: [group_b, 'Iran'],

  fra: [group_c, 'France'],
  aus: [group_c, 'Australia'],
  per: [group_c, 'Peru'],
  den: [group_c, 'Denmark'],

  arg: [group_d, 'Argentina'],
  isl: [group_d, 'Iceland'],
  cro: [group_d, 'Croatia'],
  nga: [group_d, 'Nigeria'],

  bra: [group_e, 'Brazil'],
  sui: [group_e, 'Switzerland'],
  crc: [group_e, 'Costa Rica'],
  srb: [group_e, 'Serbia'],

  ger: [group_f, 'Germany'],
  mex: [group_f, 'Mexico'],
  swe: [group_f, 'Sweden'],
  kor: [group_f, 'South Korea'],

  bel: [group_g, 'Belgium'],
  pan: [group_g, 'Panama'],
  tun: [group_g, 'Tunisia'],
  eng: [group_g, 'England'],

  pol: [group_h, 'Poland'],
  sen: [group_h, 'Senegal'],
  col: [group_h, 'Colombia'],
  jpn: [group_h, 'Japan']
}

teams.each do |key, value|
  fifa_country_code = key.to_s.upcase
  group, name = value

  team = team_repository.find_or_initialize_by_fifa_country_code(fifa_country_code)
  updated_team = Team.new(id: team.id, fifa_country_code: fifa_country_code, name: name, group_id: group.id)
  team_repository.create_or_update!(updated_team)
end
