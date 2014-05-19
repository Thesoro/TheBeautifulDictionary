require 'test_helper'

class Api::V1::BeginningWith < ActionDispatch::IntegrationTest
  
  describe 'GET /api/v1/words/starting_with' do

    before do
      Word.create(spelling: 'HOmerun')
      Word.create(spelling: 'hoMEly')
      Word.create(spelling: 'homer')
      Word.create(spelling: 'ahomeley')
      Word.create(spelling: 'nokhome')
    end

    after do
      Word.delete_all
    end

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

  private 

  def all_words_must_match(words, regex)
    words.each { |w| w.must_match regex }
  end

  def returned_spellings
    json = JSON.parse(response.body)
    json['words'].map { |hash| hash['spelling'] }
  end

end
