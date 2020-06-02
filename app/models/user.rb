class User < ApplicationRecord
  has_secure_password validations: true
  validates :mail, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  has_many :tasks, dependent: :destroy, foreign_key:"user_id"	

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA256.hexdigest(token.to_s)
  end
end
