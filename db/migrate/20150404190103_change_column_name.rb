class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :players, :password, :password_digest
  end
end
