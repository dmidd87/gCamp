class Membership < ActiveRecord::Base

  belongs_to :project
  belongs_to :user

  validates :user, :uniqueness => {scope: :project_id, message: "has already been added"}
  validates :user, presence: true
  validates :role, presence: true

def full_name
  "#{first_name} #{last_name}"
end

end
