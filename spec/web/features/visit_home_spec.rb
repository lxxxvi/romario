require 'features_helper'

describe 'visit home' do
  it 'is successful' do
    visit '/'

    page.body.must_include('World Cup 2018')
  end
end
