class WaitQueue < ApplicationRecord
    validates :name, presence: true
    validates :admin_id, presence: true
    validates :reset_time, presence: true
    validates :admin_id, presence: true # case_sensitive:false subtend Upper/Lower case 
#    validates :admin_id, uniqueness: { case_sensitive: false } # case_sensitive:false subtend Upper/Lower case 

    has_many :waiters

    def print_created_at
        created_at.strftime("%Y/%m/%d %H:%M:%S")
    end
end
