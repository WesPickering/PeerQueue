class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_secure_password

  def student?
    self.role.downcase == 'student'
  end
  def ta?
    self.role.downcase == 'ta'
  end
  def instructor?
    self.role.downcase == 'instructor'
  end
end
