class User < ApplicationRecord
    validates :password, length: {minimum: 6, allow_nil: true}
    validates :username, uniqueness: true, presence: true
    validates :password_digest {message: "password cannot be blank"}
    validates :session_token, uniqueness: true, presence: true
    attr_reader :password

    def self.find_by_user_credentials(username, password)
        user = User.find_by(username: username)
        return nil if user.nil?

        user.is_password?(password) ? user : nil
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        session[:session_token] = self.class.generate_session_token
        self.save
        self.session_token
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        self.save
        @password = password
    end

    def is_password?(password)
        pass_check = BCrypt::Password.new(password)
        pass_check.is_password?(password)
    end

    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end
    

end