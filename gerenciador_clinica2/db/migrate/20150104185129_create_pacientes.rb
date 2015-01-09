class CreatePacientes < ActiveRecord::Migration
  def up
    create_table :pacientes do |t|
    	t.string "nome", :null => false
    	t.string "rg", :null => false
      t.string "cpf", :null => false
      t.date "nascimento", :null => false
      t.string "convenio" 
    	t.string "email", :null => false, :limit => 100
    	t.string "endereco"
    	t.integer "telefone"
    	t.string "password_digest", :null => false
      t.timestamps null: false
    end
  end

  def down
  	drop_table :pacientes
  end
end
