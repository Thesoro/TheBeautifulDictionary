class Api::V1::WordSearchController < ApplicationController

  before_action :find_spelling

  def starting_with
    @words = Word.where("spelling like '#{@spelling}%'")
    render json: { words: @words }
  end

  def ending_with
    @words = Word.where("spelling like '%#{@spelling}'")
    render json: { words: @words }
  end

  def containing
    @words = Word.where("spelling like '%#{@spelling}%'")
    render json: { words: @words }
  end


  private

  def find_spelling
    @spelling = params[:spelling]
  end
end
