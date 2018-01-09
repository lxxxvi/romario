require_relative '../../../spec_helper'

describe Web::Views::Groups::Index do
  PLACEHOLDER_MESSAGE = 'No groups here'.freeze

  let(:exposures) { Hash[groups: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/groups/index.html.haml') }
  let(:view)      { Web::Views::Groups::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #groups' do
    view.groups.must_equal exposures.fetch(:groups)
  end

  describe 'when there are no groups' do
    it 'shows a placeholder text' do
      rendered.must_include(PLACEHOLDER_MESSAGE)
    end
  end

  describe 'when there are groups' do
    let(:group_x) { Group.new(letter: 'X') }
    let(:group_y) { Group.new(letter: 'Y') }

    let(:exposures) { Hash[groups: [group_x, group_y]] }

    it 'lists them all' do
      rendered.scan(/class='group'/).count.must_equal 2
      rendered.must_include('Group X')
      rendered.must_include('Group Y')
    end

    it 'hides the placeholder' do
      rendered.wont_include(PLACEHOLDER_MESSAGE)
    end
  end
end
