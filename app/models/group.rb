class Group < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy
  mount_uploader :icon, PictureUploader

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :user_id, presence: true

  scope :alphabetical_order, -> { order(name: :asc) }
end
