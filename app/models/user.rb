class User < ActiveRecord::Base

  before_save { |user| user.email_address = email_address.downcase }

  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :email_address, presence: true, uniqueness: true

  has_secure_password
end
