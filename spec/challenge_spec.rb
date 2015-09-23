require './challenge'
require 'spec_helper'
describe Challenge do
  describe '#first_step' do
    it 'Structure the request should be www.aerial-valor-93012.appspot.com/challenge' do
      teste = Challenge.new
      path = teste.path
      uri = teste.uri
      expect(teste.path).to eq('/challenge')
      expect(teste.uri).to eq('www.aerial-valor-93012.appspot.com')
    end
  end
end
