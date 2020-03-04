class Transaction < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :group
  validates :amount, presence: true
  validates :amount, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { less_than: 1000, greater_than: 0 }
  validates :author_id, presence: true
  validates :group_id, presence: true

  scope :with_group, -> { where.not(group_id: nil).order(created_at: :desc) }
  scope :without_group, -> { where(group_id: nil).order(created_at: :desc) }
end
