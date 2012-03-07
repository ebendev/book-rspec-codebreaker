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
        mark << '-' if delete_first guess, c
      end

      @output.puts mark.join
    end

    def delete_first(array, o)
      array.delete_at(array.index(o)) if array.index(o)
    end
  end
end
