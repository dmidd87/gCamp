class PagesController < ApplicationController

  def index


    quote1 = Quote.new
    quote1.text = "Failure is not an option"
    quote1.author = "-Bob"

    quote2 = Quote.new
    quote2.text = "Success please"
    quote2.author = "-Me"

    quote3 = Quote.new
    quote3.text = "Win everything!"
    quote3.author = "-Stan"

    @quotes = [quote1, quote2, quote3]
  end

end
