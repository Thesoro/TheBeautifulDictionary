class Definition  
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, type: String
  field :part_of_speech, type: String
  embedded_in :word
end
