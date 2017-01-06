module SessionsHelper
    
    def login_in (user)
        remember_token = user.remember_token
        cookies.permanent[:remember_token] = remember_token
        user.update_attribute(:remember_token, User.digest(remember_token))
        self.current_user = user
    end
    
    def current_user=(user)
        @current_user = user
        
    end
    
    def current_user
        remember_token = User.digest(cookies[:remember_token])
        user = @current_user ||= User.find_by(remember_token: remember_token)
        return nil unless user
        user
    end
    
    def log_out
        current_user.update_attribute(:remember_token, User.digest(current_user.generate_token))
        cookies.delete(:remember_token)
        self.current_user = nil
        
    end
    
    def logged_in?
        !current_user.nil?
    end
    
    def require_login
        unless logged_in?
            redirect_to root_path
        end
    end
end
