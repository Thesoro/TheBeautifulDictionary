class Word
  include Mongoid::Document
  include Mongoid::Timestamps
  field :spelling, type: String
  index spelling: 1
  embeds_many :definitions
end
