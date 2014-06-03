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

  def self.exact_match spelling
    self.search_spelling /^#{spelling}$/i
  end

  def self.best_match_for spelling
    best = self.exact_match spelling
    return best unless best.empty?
    self.starting_with spelling
  end

  def self.search_spelling regex
    Word.where(spelling: regex)
  end


end
