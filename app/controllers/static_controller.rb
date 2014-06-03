class StaticController < ApplicationController

  def home
    number = rand(Word.count)
    @word = Word.all.limit(1).offset(number).first
    redirect_to @word
  end

  def random
    number = rand(Word.count)
    @word = Word.all.limit(1).offset(number).first
  end

end
