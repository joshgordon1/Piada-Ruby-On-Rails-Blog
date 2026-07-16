class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :blog_posts

  validates :first_name, :last_name, presence: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
