class CreateWisdoms < ActiveRecord::Migration
  def self.up
    create_table :wisdoms do |t|
      t.text    :quote
      t.integer :user_id
      t.integer :submitter_age
      t.integer :karma, :default => 1
      t.timestamps
    end
  end

  def self.down
    drop_table :wisdoms
  end
end
