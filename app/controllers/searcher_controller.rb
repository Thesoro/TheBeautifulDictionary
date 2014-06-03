class SearcherController < ApplicationController

  def spelling
    term = params[:spelling]
    @candidates = WordSearcher.best_match_for term
    @word = @candidates.first
    @word = Word.new(spelling: "NOTHING FOUND") if @word.nil?
    render template: 'words/show'
  end

end
