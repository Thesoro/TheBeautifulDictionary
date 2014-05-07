class Word < ActiveRecord::Base
  has_many :definitions

  def self.starting_with spelling
    self.search_spelling "#{spelling.downcase}%"
  end

  def self.containing spelling
    self.search_spelling "%#{spelling.downcase}%"
  end

  def self.ending_with spelling
    self.search_spelling "%#{spelling.downcase}"
  end

  private

  def self.search_spelling query
    Word.where("lower(spelling) like :input", input: query)
  end

end
