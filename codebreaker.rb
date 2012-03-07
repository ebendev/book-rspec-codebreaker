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
      mark = ''

      secret, guess = *@secret.split('').zip(guess.split('')).reject do |s, g|
        mark.insert 0, '+' if s == g
      end.transpose

      secret.each do |c|
        mark << '-' if guess.delete_at(guess.index c) unless not guess.index c
      end unless mark.length > 3

      @output.puts mark
    end
  end
end
