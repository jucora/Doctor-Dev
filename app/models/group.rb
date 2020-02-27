class Group < ApplicationRecord
  belongs_to :user
  has_many :transactions
  mount_uploader :icon, PictureUploader
end
