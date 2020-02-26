class Transaction < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :group
end
