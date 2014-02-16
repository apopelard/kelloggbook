class AddRightToUsers < ActiveRecord::Migration
  def change
    add_column :users, :right, :integer, :default => 0
  end
end
