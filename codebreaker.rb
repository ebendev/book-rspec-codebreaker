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
      (0..3).each do |index|
        if guess[index] == @secret[index]
          mark.insert(0, '+')
        elsif guess.include?(@secret[index])
          mark << '-'
        end
      end
      @output.puts mark
    end
  end
end
