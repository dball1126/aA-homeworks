class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :password, length: {minimum: 6, allow_nil: true}
    validates :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: {message: "Password cannot be blank"}
    after_initialize :ensure_session_token
    attr_reader :password

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
            return nil if user == nil
            user.is_password?(password) ? user : nil
    end

    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.save!

        self.session_token
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        self.save!
        @password = password
    end

    def is_password?(password)
        pass_check = BCrypt::Password.new(self.password_digest)
        pass_check.is_password?(password)
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end
end