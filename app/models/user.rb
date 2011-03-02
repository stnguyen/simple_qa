class User
  include Mongoid::Document
  include Mongoid::Voter
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  references_many :questions
  references_many :answers  
end
