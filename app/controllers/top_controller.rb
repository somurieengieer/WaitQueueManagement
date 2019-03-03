class TopController < ApplicationController
    def index
        if admin_id = session[:admin_id]
            @wait_queue = WaitQueue.find_by(admin_id: admin_id)
            if @administrator = Administrator.find_by(id: admin_id)
                redirect_to administrator_url(id: admin_id)
            end
        else
            reset_session
            @administrator = Administrator.new
        end
    end
end
