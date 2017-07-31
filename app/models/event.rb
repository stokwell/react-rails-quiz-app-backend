class Event < ApplicationRecord
  belongs_to :user
  has_many :categorizations
  has_many :categories, through: :categorizations

  mount_base64_uploader :cover, CoverUploader
end
