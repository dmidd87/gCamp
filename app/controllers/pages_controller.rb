class PagesController < ApplicationController

  def index
    @quotes = [
      ["Failure is not an option", "-Bob"],
      ["Success please", "-Me"],
      ["Win everything!", "-Stan"]
    ]
  end

end
