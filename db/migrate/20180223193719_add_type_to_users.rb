class AddTypeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :usr_type, :string
  end
end
