class CreateConsultas < ActiveRecord::Migration
  def up
    create_table :consultas do |t|
    	t.integer "paciente_id"
    	t.integer "medico_id"
    	t.datetime "data_consulta"
    	t.boolean "confirmada"
      t.timestamps null: false
    end
  end

  def down
  	drop_table :consultas
  end
end