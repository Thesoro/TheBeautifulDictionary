class StaticController < ApplicationController

  def home
    number = rand(Word.count)
    @word = Word.find(number)
    redirect_to @word
  end

end
