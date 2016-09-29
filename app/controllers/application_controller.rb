class ApplicationController < ActionController::Base
  protect_from_forgery
#    def after_sign_in_path_for(resource)
#        '/users/me'
#    end
    
     private
    def check_session!
        if user_signed_in? == false
            redirect_to root_path
        end
    end
    
end
