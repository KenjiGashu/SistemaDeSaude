class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
    	t.string "nome", :null => false
    	t.string "email", :null => false, :limit => 100
    	t.string "usuario", :null => false
    	t.string "password_digest", :null => false
      t.timestamps null: false
    end
  end
end
