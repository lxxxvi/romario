require "spec_helper"

describe Web::Views::ApplicationLayout do
  let(:layout)   { Web::Views::ApplicationLayout.new(template, {}) }
  let(:rendered) { layout.render }
  let(:template) { Hanami::View::Template.new('apps/web/templates/application.html.haml') }

  it 'contains application name' do
    rendered.must_include('World Cup 2018')
  end
end
