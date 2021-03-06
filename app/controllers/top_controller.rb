class TopController < ApplicationController
    def index
        admin_id = session[:admin_id]
        @wait_queue = WaitQueue.find_by(admin_id: admin_id)
        @administrator = Administrator.find_by(id: admin_id)
        if !@administrator
            reset_session
        end
    end
end
