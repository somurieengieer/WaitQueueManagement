class WaitQueue < ApplicationRecord
    validates :name, presence: true
    validates :admin_id, presence: true
    validates :reset_time, presence: true
end
