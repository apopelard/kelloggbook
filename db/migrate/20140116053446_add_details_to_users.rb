class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :jv_presence, :boolean, :default => false, :null => false
    add_column :users, :jv_first_name, :string
    add_column :users, :jv_last_name, :string
    add_column :users, :kwest_attended, :string
    add_column :users, :kwest_led, :string
  end
end
