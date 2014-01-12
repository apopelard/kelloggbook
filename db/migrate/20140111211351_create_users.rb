class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :program_id, :default => 0
      t.integer :section_id, :default => 0
      t.text :quote
      t.boolean :agreement, :default => true, :null => false
      t.timestamp
    end
  end
end
