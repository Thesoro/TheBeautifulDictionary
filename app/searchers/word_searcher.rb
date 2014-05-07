class WordSearcher
  
  def self.starting_with spelling
    self.search_spelling "#{spelling.downcase}%"
  end

  def self.containing spelling
    self.search_spelling "%#{spelling.downcase}%"
  end

  def self.ending_with spelling
    self.search_spelling "%#{spelling.downcase}"
  end

  def self.search_spelling spelling
    Word.where("lower(spelling) like :input", input: spelling)
  end

  

end
