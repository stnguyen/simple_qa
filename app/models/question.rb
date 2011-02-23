class Question
  include Mongoid::Document
  field :title, :type => String
  field :body, :type => String
  
  references_many :answers
end
