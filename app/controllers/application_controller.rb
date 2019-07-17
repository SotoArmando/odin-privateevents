
class ApplicationController < ActionController::Base
    include SessionsHelper

    def authenticated!
       unless logged_in?
        flash[:danger] = 'Sign in to go there'
        redirect_to signin_path
       end
    end
end
