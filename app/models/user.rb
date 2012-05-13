class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_many :youtube_links
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token


  validates :email, presence: true, format: { with: /[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
