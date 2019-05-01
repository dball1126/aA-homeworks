class User < ApplicationRecord
    attr_reader :password

    validates :username, presence: true
    validates :password_digest, presence: { message: 'Password cannot be blank'}
    validates :password, length: { minimum: 6, allow_nil: true }


    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil if user.nil?
        user.is_password?(password) ? user : nil 
    end
    
    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        self.password_digest = BCrypt::Password.create(password)
    end

    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.save!
        self.session_token
    end

    private

    def ensure_session_token
        self.sessino_token ||= self.class.generate_session_token
    end

    def

end
