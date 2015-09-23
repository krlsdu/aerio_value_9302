require "spec_helper"
require "./challenge"

describe Challenge do
  describe "#first_step" do
    it "Response toke and value" do
      teste = Challenge.new
      one = teste.first_step
      expect(one).to be_kind_of(Hash)
    end
  end
end
