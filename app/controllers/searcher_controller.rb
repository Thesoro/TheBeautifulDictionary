class SearcherController < ApplicationController

  def spelling
    term = params[:spelling]
    @candidates = WordSearcher.containing term
    @word = @candidates.first
    render template: 'words/show'
  end

end
