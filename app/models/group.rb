class Group < ApplicationRecord
  belongs_to :transaction
  belongs_to :user
  has_many :transactions
end
