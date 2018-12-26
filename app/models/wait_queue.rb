class WaitQueue < ApplicationRecord
    validates :name, presence: true
    validates :admin_id, presence: true
    validates :reset_time, presence: true
    validates :admin_id, uniqueness: { case_sensitive: false } # case_sensitive:false subtend Upper/Lower case 
end
