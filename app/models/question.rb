class Question
  include Mongoid::Document
  include Mongoid::Voteable
  
  field :title, :type => String
  field :body, :type => String
  
  validates :title, :presence => true, :length => { :minimum => 10 }
  validates :body, :presence => true 
  
  references_many :answers
  
  vote_point self, :up => +1, :down => -1
end
