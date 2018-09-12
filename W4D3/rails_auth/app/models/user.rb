class User < ApplicationRecord
  before_validation :ensure_session_token
  validates :username, :session_token, presence: true
   validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_digest, presence: true


  def self.find_by_credentials(uname, pword)
    dummy = User.find_by(username: uname)
    return nil if dummy.nil?
    if @password_digest = BCrypt::Password.create(pword)
      return dummy
    else
      nil
    end
  end

  def self.generate_session_token
    @session_token = SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    generate_session_token
    self.save
  end

  def password=(pword)
    @password = pword
    @password_digest = BCrypt::Password.create(pword)
  end

private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
