require_relative '../../spec_helper'

describe Group do
  it 'can be initialized with attributes' do
    group = Group.new(name: 'A')
    group.name.must_equal 'A'
  end
end
