class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  before_validation :generate_default_name, on: :create

  private
  def generate_default_name
    if username.blank?
       self.username = "user_#{Time.current.strftime('%Y%m%d%H%M%S%6N')}"
    end
  end
end
