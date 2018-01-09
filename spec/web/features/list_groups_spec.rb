require 'features_helper'

describe 'list groups' do
  let(:repository) { GroupRepository.new }
  before do
    repository.clear

    repository.create(letter: 'X')
    repository.create(letter: 'Y')
  end

  it 'displays all groups on the page' do
    visit '/groups'

    within '#groups' do
      assert page.has_css?('.group', count: 2), 'Expected to find 8 groups'
    end
  end
end
