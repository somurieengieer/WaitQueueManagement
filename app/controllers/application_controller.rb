class ApplicationController < ActionController::Base
    before_action  :manage_session

    def manage_session
        if session[:admin_id]
            @login_administrator = Administrator.find(session[:admin_id])
        end
        if session[:store_view_mode]
            @store_view_mode = true
        end
        if session[:store_view_mode]
            unless controller_name == 'wait_queues' && (action_name == 'viewmodeoff' || action_name == 'viewmode')
                redirect_to viewmode_wait_queue_path
            end
        end
    end
end
