class SearcherController < ApplicationController

  def spelling
    term = params[:spelling]
    @candidates = Word.where("spelling like ?", "%#{term}%")
    render json: @candidates || []
  end

end
