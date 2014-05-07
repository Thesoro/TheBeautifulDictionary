class Api::V1::WordSearchController < ApplicationController

  before_action :check_blank

  def starting_with
    @words = WordSearcher.starting_with spelling
    render json: { words: @words }
  end

  def ending_with
    @words = WordSearcher.ending_with spelling
    render json: { words: @words }
  end

  def containing
    @words = WordSearcher.containing spelling
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
