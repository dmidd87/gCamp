class User < ActiveRecord::Base

  has_many :memberships, dependent: :destroy
  has_many :projects, through: :memberships
  has_many :comments, dependent: :nullify

  before_save { |user| user.email_address = email_address.downcase }

  def full_name
    "#{first_name} #{last_name}"
  end

  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :email_address, presence: true, uniqueness: true

  has_secure_password
end
