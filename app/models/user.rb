class User < ApplicationRecord
    attr_accessor :remember_attr
    before_create :generate_token
    
    
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    
    has_secure_password
    
    validates :password,presence: true
    
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    
    def User.digest(string)
        Digest::SHA1.hexdigest(string.to_s)
    end
    
    def authenticated?(remember_stuff)
        return false if remember_token.nil?
        
    end
    
    def generate_token
        #assigns remember token value to new token value generated
        self.remember_token = User.digest(User.new_token)
        
    end
    
end
