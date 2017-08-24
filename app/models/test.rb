class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  mount_base64_uploader :cover, CoverUploader
end
