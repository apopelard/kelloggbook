class AddRegisterToUser < ActiveRecord::Migration
  def change
    add_column :users, :registered, :boolean, :default => false, :null => false
  end
end
