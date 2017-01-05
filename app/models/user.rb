class User < ApplicationRecord
    
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    
    has_secure_password
    
    validates :password,presence: true
end
