class Api::V1::WordSearchController < ApplicationController

  before_action :check_blank

  def starting_with
    @words = Word.starting_with spelling
    render json: { words: @words }
  end

  def ending_with
    @words = Word.ending_with spelling
    render json: { words: @words }
  end

  def containing
    @words = Word.containing spelling
    render json: { words: @words }
  end


  private

  def spelling
    @spelling ||= params[:spelling]
  end

  def check_blank
    if spelling.blank?
      render json: { message: "No blank searches allowed." }, status: :bad_request
    end
  end
end
