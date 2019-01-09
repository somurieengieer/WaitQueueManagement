class RemoveCompanyFromWaitQueues < ActiveRecord::Migration[5.2]
  def change
    remove_column :wait_queues, :company, :string
  end
end
