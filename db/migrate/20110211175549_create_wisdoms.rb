class CreateWisdoms < ActiveRecord::Migration
  def self.up
    create_table :wisdoms do |t|
      t.text :quote
      t.string :contributor
      t.integer :upvotes
      t.integer :downvotes
      t.integer :karma

      t.timestamps
    end
  end

  def self.down
    drop_table :wisdoms
  end
end
