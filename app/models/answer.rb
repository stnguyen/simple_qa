class Answer
  include Mongoid::Document
  include Mongoid::Voteable
  
  field :content, :type => String
  
  referenced_in :question
  
  vote_point self, :up => +1, :down => -2
  vote_point Question, :up => +2, :down => -1
end
