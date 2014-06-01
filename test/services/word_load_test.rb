require 'test_helper'

describe GrabWordFromWordNet do

  before do
    Word.delete_all
  end

  it 'is a test' do
    word =  GrabWordFromWordNet.call 'dog'
    word.nil?.must_equal false
    word.definitions.count.must_be :>, 0
  end

end
