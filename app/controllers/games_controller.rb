require "open-uri"

class GamesController < ApplicationController
  def initialize
    puts " >>>> INITIALIZE GAMES CONTROLLERS <<<< "
    # executé a chaque action
  end

  def new
    alphabet = ("A".."Z").to_a
    @@biblio = []
    10.times { @@biblio << alphabet.sample }
    @letters = @@biblio
  end

  def score
    session[:score] = 0 if session[:score].nil?
    @word = params["word"].upcase
    if  !@word.split("").all?{ |letter| @@biblio.include?(letter) }
      @answer = "Sorry, but #{@word.upcase} can't be built out of #{@@biblio.join(', ')}"
    else
      url = "https://wagon-dictionary.herokuapp.com/#{@word}";
      response = JSON.parse(open(url).read)
      if(response["found"] == true)
        @answer = "Congratulation"
        session[:score] += @word.length;
      else
        @answer = "Sorry but #{@word.upcase} does not seem to be a valid English word..."
      end
    end
    @score = session[:score]
  end
end
