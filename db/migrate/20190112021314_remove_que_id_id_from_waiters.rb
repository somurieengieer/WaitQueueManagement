class RemoveQueIdIdFromWaiters < ActiveRecord::Migration[5.2]
  def change
    remove_reference :waiters, :que_id, index: true
  end
end
