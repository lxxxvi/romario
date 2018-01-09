require_relative '../../spec_helper'

describe GroupRepository do

  let(:repository) { GroupRepository.new }

  before do
    repository.clear

    repository.create(name: 'X')
    repository.create(name: 'Y')
    repository.create(name: 'A')
  end

  it 'orders by name' do
    first_group = repository.ordered_by_name.first

    first_group.name.must_equal 'A'
  end
end
