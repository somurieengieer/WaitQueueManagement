class ApplicationController < ActionController::Base
    before_action  :manage_session

    def manage_session
        if session[:admin_id]
            @login_administrator = Administrator.find(session[:admin_id])
            reflesh_store_view_mode
            if session[:store_view_mode]
                unless controller_name == 'wait_queues' && (action_name == 'viewmodeoff' || action_name == 'viewmode')
                    redirect_to viewmode_wait_queue_path
                end
            end
        elsif 
            session.delete(:store_view_mode)
            redirect_to root_path, notice: 'Please Login.' unless controller_name == 'top' && action_name == 'index' || controller_name == 'sessions' && action_name == 'create'
        end
    end
    def reflesh_store_view_mode
        if session[:store_view_mode]
            @store_view_mode = true
        end
    end
end
