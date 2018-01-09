group_repository = GroupRepository.new

("A".."H").each do |letter|
  group_repository.find_or_create_by_letter!(letter)
end
