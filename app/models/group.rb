class Group < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy
  mount_uploader :icon, PictureUploader

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :icon, presence: true
  validates :user_id, presence: true
end
