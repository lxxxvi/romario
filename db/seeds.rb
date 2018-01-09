this_directory_path  = File.expand_path(File.dirname(__FILE__))
sql_seeds_directory_path = Pathname.new("#{this_directory_path}/seeds/sql/")


db_connection = Hanami::Model.configuration.connection
# [
#   'groups.rb',
#   'teams.rb'
# ].each do |seeds_file_name|
#   seeds_file_path = "#{seeds_directory_path}/#{seeds_file_name}"
#   load seeds_file_path
# end
sql_seeds_directory_path.children.sort.each do |sql_file|
  puts "loading #{sql_file}"
  db_connection.execute(sql_file.read)
end

# Hanami::Model.configuration.url
#  => "postgresql://localhost/romario_development"


