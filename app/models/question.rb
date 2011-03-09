class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Voteable
  include Mongoid::Slug
  
  field :title, :type => String
  field :body, :type => String

  slug :title
  
  validates :title, :presence => true, :length => { :minimum => 10 }
  validates :body, :presence => true 
  
  references_many :answers
  referenced_in :user
  
  vote_point self, :up => +1, :down => -1
end
