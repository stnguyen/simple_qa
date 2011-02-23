class Answer
  include Mongoid::Document
  field :content, :type => String
  
  referenced_in :question
end
