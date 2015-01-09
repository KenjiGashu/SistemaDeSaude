class CreateConcorrentes < ActiveRecord::Migration
  def change
    create_table :concorrentes do |t|
    	t.string "nome", null: false, :default => "pinto"
    	t.string "rg", null: false
    	t.string "cpf", null: false
    	t.date "data_nascimento", null: false
    	t.string "endereco", null: false
    	t.string "formacao", null: false
    	t.boolean "experiencia" 
        t.string "cargo", null: false
        t.timestamps null: false
    end
  end
end
