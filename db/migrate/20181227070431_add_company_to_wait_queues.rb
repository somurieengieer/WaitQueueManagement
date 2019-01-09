class AddCompanyToWaitQueues < ActiveRecord::Migration[5.2]
  def change
    add_column :wait_queues, :company, :string
  end
end
