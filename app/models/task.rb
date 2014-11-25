class Task < ActiveRecord::Base

  has_many :comments
  validates :description, presence:true

end
