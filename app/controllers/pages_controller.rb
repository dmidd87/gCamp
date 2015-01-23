class PagesController < PublicController

  def index

    quote1 = Quote.new
    quote1.text = "You have to learn the rules of the game.  And then you have to play better than everyone else."
    quote1.author = "-Albert Einstein"

    quote2 = Quote.new
    quote2.text = "Do not take life too seriously.  You will never get out alive."
    quote2.author = "-Elbert Hubbard"

    quote3 = Quote.new
    quote3.text = "It does not matter how slowly you go as long as you don't stop"
    quote3.author = "-Confucious"

    @quotes = [quote1, quote2, quote3]
  end
end
