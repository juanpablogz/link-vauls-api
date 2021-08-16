class AddDefaultValueToRoleUser < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :role, :default => 2
  end
end
