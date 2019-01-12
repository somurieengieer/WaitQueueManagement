class AddWaitQueueIdToWaiters < ActiveRecord::Migration[5.2]
  def up
    add_reference :waiters, :wait_queue, null: false, index: true
  end
  def down
    remove_reference :waiters, :wait_queue, index: true
  end
end
