class WordSearcher
  
  def self.starting_with spelling
    self.search_spelling /^#{spelling}.*$/i 
  end

  def self.containing spelling
    self.search_spelling /#{spelling}/i
  end

  def self.ending_with spelling
    self.search_spelling /^.*#{spelling}$/i
  end

  def self.search_spelling regex
    Word.where(spelling: regex)
  end

end
