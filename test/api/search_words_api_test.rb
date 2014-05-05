require 'test_helper'

class SearchWordTest < ActionDispatch::IntegrationTest
  
  describe 'GET /api/v1/words_starting_with' do

    it 'errors for emtpy query' do
      get '/api/v1/words/starting_with'
      status.must_equal 400
    end

    it 'returns words beginning with "home"' do
      get '/api/v1/words/starting_with', { spelling: 'home' }
      status.must_equal 200
    
      spellings = returned_spellings
      spellings.count.must_equal 3
      all_words_must_match spellings, /^home\w*/i
    end

    it 'returns a case insensitive words beginning with "HOME"' do
      get '/api/v1/words/starting_with', { spelling: 'HOME' }
      status.must_equal 200
    
      spellings = returned_spellings
      spellings.count.must_equal 3
      all_words_must_match spellings, /^home\w*/i
    end
  end


  describe 'GET /api/v1/words/ending_with {spelling: "__WORD__"}' do

    it 'errors for emtpy query' do
      get '/api/v1/words/starting_with'
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


  describe 'GET /api/v1/words/containing' do

    it 'errors for emtpy query' do
      get '/api/v1/words/starting_with'
      status.must_equal 400
    end

    it 'should return a list of words containing "ppe"' do
      get '/api/v1/words/containing', { spelling: 'ppe' }
      status.must_equal 200

      spellings = returned_spellings
      spellings.count.must_equal 3
      all_words_must_match spellings, /\w*ppe\w*$/i
    end

    it 'returns words containing "PPE"' do
      get '/api/v1/words/containing', { spelling: 'PPE' }
      status.must_equal 200

      spellings = returned_spellings
      spellings.count.must_equal 3
      all_words_must_match spellings, /\w*ppe\w*$/i
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
