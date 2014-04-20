require 'wordnet'

words = ""

index = WordNet::NounIndex.instance
File.open('/usr/share/dict/words').each do |line|
  lemma = index.find(line.chomp)
  if lemma

    varname = "var_#{lemma.lemma}"

    word = <<-WORDDEF
      #{varname} = Word.create(spelling: "#{lemma.lemma}")
    WORDDEF
    words << word

    lemma.synsets.each do |synset| 
      definition = <<-DEFINITION
        #{varname}.definitions.create(content: #{synset.gloss.inspect[0..-1]}, part_of_speech: 'noun')
      DEFINITION
      words << definition
    end

    words << "\n\n"
    

  end
end


File.open('~/Desktop/noun_seeds_from_wordnet.rb', 'w+') {|f| f.write(words) }

