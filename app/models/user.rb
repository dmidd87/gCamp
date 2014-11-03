class User < ActiveRecord::Base

  validates :email_address, presence: true, uniqueness: true
  before_save { |user| user.email_address = email_address.downcase }
  has_secure_password

end
