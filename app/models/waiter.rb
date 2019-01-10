class Waiter < ApplicationRecord
    def self.getStatusAry
        return [["",""], ["△","△"], ["済","済"]]
    end
end
