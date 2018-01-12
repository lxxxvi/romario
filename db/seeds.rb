this_directory_path  = File.expand_path(File.dirname(__FILE__))
sql_seeds_directory_path = Pathname.new("#{this_directory_path}/seeds/sql/")

db_connection = Hanami::Model.configuration.connection

sql_file_names = [
  '01_groups.sql',
  '02_venues.sql',
  '03_teams.sql',
  '04_matches.sql'
]

unless Hanami.env == 'production'
  sql_file_names << '05_users.sql'
  sql_file_names << '06_predictions.sql'
end

sql_file_names.each do |sql_file_name|
  sql_file_path = sql_seeds_directory_path.join(sql_file_name)
  puts "loading #{sql_file_path}"
  db_connection.execute(sql_file_path.read)
end

unless Hanami.env == 'production'
  # some results
  team_repository       = TeamRepository.new
  match_repository      = MatchRepository.new
  user_repository       = UserRepository.new
  prediction_repository = PredictionRepository.new

  user = user_repository.first

  some_group_stage_results = [
    ['RUS', 'KSA', 0, 0],
    ['EGY', 'URU', 0, 1],
    ['MAR', 'IRN', 2, 1],
    ['POR', 'ESP', 1, 1],
    ['FRA', 'AUS', 4, 1],
    ['ARG', 'ISL', 0, 1],
    ['PER', 'DEN', 2, 2],
    ['CRO', 'NGA', 3, 0],
    ['CRC', 'SRB', 1, 2],
    ['GER', 'MEX', 4, 0]
  ]

  some_group_stage_results.each do |group_stage_result|
    left_team_code, right_team_code, left_team_score, right_team_score = group_stage_result

    left_team   = team_repository.by_fifa_country_code(left_team_code)
    right_team  = team_repository.by_fifa_country_code(right_team_code)
    
    the_match = match_repository.by_phase_and_teams('Group stage', left_team, right_team)
    next if the_match.nil?
    match_repository.update(
      the_match.id,
      left_team_score: left_team_score,
      right_team_score: right_team_score
    )
  end

  some_group_stage_predictions = [
    ['RUS', 'KSA', 0,  0],
    ['EGY', 'URU', 0,  0],
    ['MAR', 'IRN', 1,  0],
    ['POR', 'ESP', 1,  0],
    ['FRA', 'AUS', 2,  0],
    ['ARG', 'ISL', 1,  1],
    ['PER', 'DEN', 0,  2],
    ['CRO', 'NGA', 0,  3],
    ['CRC', 'SRB', 4,  1],
    ['GER', 'MEX', 9, 10]
  ]

  some_group_stage_predictions.each do |group_stage_prediction|
    left_team_code, right_team_code, left_team_score, right_team_score = group_stage_prediction

    left_team   = team_repository.by_fifa_country_code(left_team_code)
    right_team  = team_repository.by_fifa_country_code(right_team_code)

    match = match_repository.by_phase_and_teams('Group stage', left_team, right_team)

    the_prediction = prediction_repository.by_match_of_user(user, match)
  end
end

