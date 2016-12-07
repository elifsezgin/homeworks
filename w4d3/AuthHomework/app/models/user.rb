class User < ActiveRecord::Base
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token


  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user && BCrypt::Password.new(password_digest).is_password?(password)
    nil
  end


  def self.generate_session_token
    # This is a helper method I like to write that uses SecureRandom::urlsafe_base64 returns a 16-digit pseudorandom string
    SecureRandom::urlsafe_base64(16)
  end

  attr_reader :password

  def reset_session_token!
  # This method resets the user's session_token and saves the user
    self.session_token = User.generate_session_token
    self.save!
    self.session_token

  end

  def ensure_session_token
  # This method makes sure that the user has a session_token set, setting one if none exists
  self.session_token ||= User.generate_session_token
  end
  def password=(pw)
  # This method sets @password equal to the argument given so that the appropriate validation can happen
  # This method also encrypts the argument given and saves it as this user's password_digest
  # Remember: you have to add an attr_reader for password for the validation to occur!
  @password = pw
  self.password_digest = BCrypt::Password.create(pw)
  end
end
