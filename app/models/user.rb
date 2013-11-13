class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :highlights
  
  attr_accessible :name

  validates :name, presence: true
  
  #  Add back if validatable commented out
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates_presence_of :password, on: :create
  # validates_presence_of :password_confirmation, on: :create
  # validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  #                   uniqueness: { case_sensitive: false }
  
                     
end
