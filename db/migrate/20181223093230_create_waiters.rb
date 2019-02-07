class CreateWaiters < ActiveRecord::Migration[5.2]
  def change
    create_table :waiters do |t|
      t.string :name
      t.integer :order_number

      t.timestamps
    end
  end
end
