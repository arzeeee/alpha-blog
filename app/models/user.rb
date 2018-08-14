class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :username, presence: true, 
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\z/i
  validates :email, presence: true, 
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end