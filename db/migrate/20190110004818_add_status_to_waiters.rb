class AddStatusToWaiters < ActiveRecord::Migration[5.2]
  def change
    add_column :waiters, :status, :string
  end
end
