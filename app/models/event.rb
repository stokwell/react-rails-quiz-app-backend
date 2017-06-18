class Event < ApplicationRecord
  has_many :categorizations
  has_many :categories, :through => :categorizations

  mount_base64_uploader :cover, CoverUploader
end
