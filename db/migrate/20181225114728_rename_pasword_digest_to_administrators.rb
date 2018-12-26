class RenamePaswordDigestToAdministrators < ActiveRecord::Migration[5.2]
  def change
    rename_column :administrators, :password, :password_digest
  end
end
