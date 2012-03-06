require 'spec_helper'
require 'codebreaker'

module Codebreaker
  describe "#start" do
    it "sends a welcome message" do
      output = double('output')
      game = Game.new(output)

      output.should_receive(:puts).with('Welcome to Codebreaker!')

      game.start
    end

    it "prompts for the first guess"
  end
end
