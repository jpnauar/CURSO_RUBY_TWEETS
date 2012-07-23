class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :screen_name
      t.string :location
      t.string :description
      t.integer :followers_count
      t.integer :friends_count

      t.timestamps
    end
    
    add_index :users, :name, :unique => true
    add_index :users, :screen_name, :unique => true    
  end
  
  def self.down
    remove_index :users, :name
    remove_index :users, :screen_name
    drop_table :users    
  end
end
