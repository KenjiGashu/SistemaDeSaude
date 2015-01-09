class CreateMedicos < ActiveRecord::Migration
  def up
    create_table :medicos do |t|
    	t.string "nome", :null => false
      t.integer "CRM", :null => false
    	t.string "especialidade"
    	t.integer "telefone"
      t.timestamps null: false
    end
  end

  def down
  	drop_table :medicos
  end
end
