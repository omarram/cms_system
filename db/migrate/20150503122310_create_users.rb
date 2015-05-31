class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|

      t.column "first_name", :string, :limit => 40
      t.string "last_name", :limit => 40
      t.string "email", :limit => 80, :default => "", :null => false
      t.string "password", :limit => 50

      t.timestamps null: false
    end
  end

  def down
  	drop_table :users
  end
end
