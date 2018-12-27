class AddNameToAdministrators < ActiveRecord::Migration[5.2]
  def change
    add_column :administrators, :name, :string
  end
end
