this_directory_path  = File.expand_path(File.dirname(__FILE__))
sql_seeds_directory_path = Pathname.new("#{this_directory_path}/seeds/sql/")

db_connection = Hanami::Model.configuration.connection

sql_seeds_directory_path.children.sort.each do |sql_file|
  puts "loading #{sql_file}"
  db_connection.execute(sql_file.read)
end

