class User < ApplicationRecord
  has_secure_password
  has_many :transactions, foreign_key: 'author_id', dependent: :destroy
  has_many :groups, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2, maximum: 10 }, uniqueness: { case_sensitive: false }

  before_create :create_remember_token

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
