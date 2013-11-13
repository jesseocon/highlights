class Highlight < ActiveRecord::Base
  attr_accessible :user_id, :title, :description
  
  belongs_to :user
  
  validates :title, presence: true
  validates :description, presence: true
  
  def to_param
    "#{id} #{title}".parameterize 
  end
end
