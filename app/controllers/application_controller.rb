class ApplicationController < ActionController::Base
    before_action  :manage_session

    def manage_session
        if session[:admin_id]
            @login_administrator = Administrator.find(session[:admin_id])
        end
    end
end
