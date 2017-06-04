class Event < ApplicationRecord
  mount_uploader :cover, CoverUploader
end
