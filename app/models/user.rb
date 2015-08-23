class User < ActiveRecord::Base
  has_many :notes

  has_secure_password

  validates :email,
            presence:   true,
            format:     /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/,
            uniqueness: true
end
