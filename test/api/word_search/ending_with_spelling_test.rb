require 'test_helper'

class Api::V1::EndingWith < ActionDispatch::IntegrationTest
  
  describe 'GET /api/v1/words/ending_with' do

    before do
      Word.create(spelling: 'paritY')
      Word.create(spelling: 'pity')
      Word.create(spelling: 'unITY')
      Word.create(spelling: 'itypm')
      Word.create(spelling: 'pitys')
    end

    after do
      Word.delete_all
    end


    it 'errors for emtpy query' do
      get '/api/v1/words/ending_with'
      status.must_equal 400
    end

    it 'finds words ending with "ity"' do
      get '/api/v1/words/ending_with', { spelling: 'ity' }
      status.must_equal 200
    
      spellings = returned_spellings
      spellings.count.must_equal 3
      all_words_must_match spellings, /\w*ity$/i
    end

    it 'finds case insensitive words ending with "ITY"' do
      get '/api/v1/words/ending_with', { spelling: 'ITY' }
      status.must_equal 200
    
      spellings = returned_spellings
      spellings.count.must_equal 3
      all_words_must_match spellings, /\w*ity$/i
    end
  end

  private

  def all_words_must_match(words, regex)
    words.each { |w| w.must_match regex }
  end

  def returned_spellings
    json = JSON.parse(response.body)
    json['words'].map { |hash| hash['spelling'] }
  end

end
