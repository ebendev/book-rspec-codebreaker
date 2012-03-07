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
      secret = @secret
      i = 0
      while i < guess.length do
        if guess[i] == secret[i]
          mark.insert(0, '+')
          guess[i] = ''
          secret[i] = ''
        else
          i += 1
        end
      end

      secret.each_char do |c|
        if guess.include? c
          mark << '-'
          guess[guess.index(c)] = ''
        end
      end
      @output.puts mark
    end
  end
end
