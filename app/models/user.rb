class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: { message: "The user with such e-mail already exists."}
  has_many :events
end
