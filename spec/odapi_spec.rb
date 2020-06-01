require 'rspec'
require '../lib/odapi.rb'
describe ODApi::ODApi do
  it 'returns heroes' do
    expect(described_class.heroes).not_to be_empty
  end

  it 'returns matches' do
    expect(described_class.matches(id: 1)).not_to be_empty
  end

  it 'returns error for 99999' do
    expect{described_class.matches(id: 99999)}.to raise_error(ODApi::ODApi::HeroNotExist,"Doesn't exists hero with id: 99999")
  end
end
