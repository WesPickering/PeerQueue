class User < ApplicationRecord
  has_secure_password

  def student?
    self.role == 'student'
  end
  def ta?
    self.role == 'ta'
  end
  def instructor?
    self.role == 'instructor'
  end
end
