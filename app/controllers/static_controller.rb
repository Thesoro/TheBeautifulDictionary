class StaticController < ApplicationController

  def get_word
    number = rand(Word.count)
    @word = Word.all.limit(1).offset(number).first
    @word
  end

  def home
    get_word
    redirect_to @word
  end

  def random
    get_word
  end

  def comparison
    @wordleft = get_word
    @wordright = get_word
  end

end
