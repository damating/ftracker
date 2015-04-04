class AddDetailsToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :email, :string
    add_column :players, :password, :string
  end
end
