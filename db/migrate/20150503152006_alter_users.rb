class AlterUsers < ActiveRecord::Migration
  def up
  	rename_table('users', 'admin_users')
  	change_column('admin_users', 'email', :string, :limit => 150, :default => nil, :null => true)
  	add_column('admin_users', 'username', :string, :limit => 100, :after => 'email')
    rename_column("admin_users", "password", "hashed_password")
    add_index("admin_users", "username")

  end

  def down
    remove_index("admin_users", "username")
    rename_column("admin_users", "hashed_password", "password")
  	remove_column('admin_users', 'username')
  	change_column("admin_users", 'email', :string, :default => "", :null => false)
  	rename_table('admin_users', 'users')
  end
end
