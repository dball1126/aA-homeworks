class User < ApplicationRecord
    validates :password, length: {minimum: 6, allow_nil: true}
    validates :username, presence: true, uniqueness: true
    validates :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: {message: "password cannot be blank"}
    after_initialize :ensure_session_token

    attr_reader :password

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil if user == nil

        if user.is_password?(password)
            return user
        end
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        self.password_digest.save
        @password = password
    end

    def is_password?(password)
        pass_check = BCrypt::Password.new(password)
        pass_check.is_password?(password)
    end

    private

    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end

end