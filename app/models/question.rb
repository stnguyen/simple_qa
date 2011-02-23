class Question
  include Mongoid::Document
  include Mongoid::Voteable
  
  field :title, :type => String
  field :body, :type => String
  
  references_many :answers
  
  vote_point self, :up => +1, :down => -1
end
