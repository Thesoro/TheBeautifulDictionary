require 'test_helper'

class Api::V1::Containing < ActionDispatch::IntegrationTest
  
  describe 'GET /api/v1/words/containing' do

    before do
      Word.create spelling: 'happen'
      Word.create spelling: 'pPErson'
      Word.create spelling: 'canaPPe'
    end

    after do
      Word.delete_all
    end


    it 'errors for emtpy query' do
      get '/api/v1/words/containing'
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
