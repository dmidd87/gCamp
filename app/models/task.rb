class Task < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  validates :description, presence:true

end
