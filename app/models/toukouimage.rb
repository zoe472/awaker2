class Toukouimage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :tweet
end
