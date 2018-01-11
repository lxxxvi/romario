require_relative '../../../spec_helper'

describe Web::Controllers::Bookie::Index do
  let(:action) { Web::Controllers::Bookie::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
