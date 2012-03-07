module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret=nil)
      @secret = secret || ''

      4.times { @secret << (1..6).to_a.sample.to_s } unless @secret.length == 4

      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess: '
    end

    def guess(guess)
      mark = []

      secret = @secret.split('')
      guess = guess.split('')

      inexact = secret.zip(guess).reject do |s, g|
        mark >> '+' if s == g
      end

      secret, guess = *inexact.transpose || [], []

      secret.each do |c|
        mark << '-' if guess.delete_first c
      end

      @output.puts mark.join
    end

    def secret
      @secret
    end
  end
end

class Array
  def >>(o)
    self.unshift o
  end

  def delete_first(o)
    self.delete_at(self.index(o)) if self.index(o)
  end
end
