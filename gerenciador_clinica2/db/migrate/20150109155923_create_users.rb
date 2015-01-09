class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string "nome", :null => false
    	t.string "rg", :null => false
      t.string "cpf", :null => false
     	t.date "nascimento", :null => false
      t.string "convenio"
    	t.string "endereco"
    	t.integer "telefone"
    	t.string "usuario", :null => false
    	t.string 'email', :null => false
    	t.string 'password', :null => false
      t.timestamps null: false
    end
  end
end
