class CreateTwits < ActiveRecord::Migration
  def self.up
    create_table :twits do |t|
      t.string :id_twit
      t.string :text
      t.string :url
      t.string :url_text
      t.references :trend
      t.references :user

      t.timestamps
    end
    add_index :twits, :id_twit, :unique => true
    add_index :twits, :trend_id, :unique => false
    add_index :twits, :user_id, :unique => false    
  end
  
  def self.down
    remove_index :twits, :id_twit
    remove_index :twits, :trend_id
    remove_index :twits, :user_id
    drop_table :twits  
  end
end
