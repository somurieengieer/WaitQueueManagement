class Waiter < ApplicationRecord
    belongs_to :wait_queue
    def self.getStatusAry
        return [["",""], ["△","△"], ["済","済"]]
    end
end
