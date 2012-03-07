module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret)
      @secret = secret
      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess: '
    end

    def guess(guess)
      mark = []

      secret = @secret.split('')
      guess = guess.split('')

      inexact = secret.zip(guess).reject do |s, g|
        mark.unshift '+' if s == g
      end

      secret, guess = *inexact.transpose || [], []

      secret.each do |c|
        mark << '-' if guess.delete_first c
      end

      @output.puts mark.join
    end
  end
end

class Array
  def delete_first(o)
    self.delete_at(self.index(o)) if self.index(o)
  end
end
