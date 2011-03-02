class Answer
  include Mongoid::Document
  include Mongoid::Voteable
  
  field :content, :type => String
  
  embedded_in :question
  references_one :user
  referenced_in :user
  
  vote_point self, :up => +1, :down => -2
  vote_point Question, :up => +2, :down => -1
end
