class CreateWaitQueues < ActiveRecord::Migration[5.2]
  def change
    create_table :wait_queues do |t|
      t.string :name
      t.integer :count
      t.integer :admin_id
      t.time :reset_time
      t.boolean :auto_reset

      t.timestamps
    end
  end
end
