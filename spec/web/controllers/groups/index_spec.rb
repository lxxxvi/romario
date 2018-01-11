require_relative '../../../spec_helper'

describe Web::Controllers::Groups::Index do
  let(:action) { Web::Controllers::Groups::Index.new }
  let(:params) { Hash[] }
  let(:repository) { GroupRepository.new }

  before do
    repository.clear

    @group = repository.create(name: 'L')
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes all groups' do
    action.call(params)
    action.exposures[:groups].must_equal [@group]
  end
end
