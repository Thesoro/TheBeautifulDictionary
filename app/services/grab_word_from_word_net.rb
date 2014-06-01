require 'wordnet'

class GrabWordFromWordNet

  def self.call spelling
    lexicon = WordNet::Lexicon.new
    original_word = WordNet::Word.by_lemma(spelling).first
    return nil if original_word.nil?

    new_word = Word.create(spelling: original_word.lemma)
    return nil unless new_word.valid?

    original_word.synsets.each do |s|
      new_word.definitions.create(part_of_speech: s.part_of_speech, content: s.definition)
    end

    new_word
  end

end
