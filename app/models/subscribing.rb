class Subscribing < ApplicationRecord
  validates :email, uniqueness: { message: "The user with such e-mail is already subscribed"}
end
