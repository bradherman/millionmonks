class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :login,             :null => false
      t.string    :email,             :null => false
      t.string    :password
      t.integer   :karma,             :default => 1
      t.integer   :age
      t.boolean   :admin,             :default => false
      t.date      :birthday
      t.string    :crypted_password
      t.string    :password_salt
      t.string    :persistence_token
      t.integer   :login_count
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
