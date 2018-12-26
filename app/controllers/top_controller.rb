class TopController < ApplicationController
    def index
        @wait_queue = WaitQueue.find_by(admin_id: session[:admin_id])

    end
end
