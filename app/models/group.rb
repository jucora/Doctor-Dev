class Group < ApplicationRecord
  belongs_to :user
  has_many :transactions
  mount_uploader :icon, PictureUploader

  validates :name, presence: true
  validates :icon, presence: true
  validates :user_id, presence: true
end
