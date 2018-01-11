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

