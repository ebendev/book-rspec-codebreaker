require 'spec_helper'
require 'codebreaker'

module Codebreaker
  describe "#start" do
    before(:each) do
      @output = double('output').as_null_object
      @game = Game.new(@output)
    end
    it "sends a welcome message" do
      @output.should_receive(:puts).with('Welcome to Codebreaker!')
      @game.start
    end

    it "prompts for the first guess" do
      @output.should_receive(:puts).with('Enter guess:')
      @game.start
    end
  end
end
