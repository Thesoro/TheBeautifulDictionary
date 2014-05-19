class Word
  include Mongoid::Document
  include Mongoid::Timestamps
  field :spelling, type: String
  embeds_many :definitions
end
