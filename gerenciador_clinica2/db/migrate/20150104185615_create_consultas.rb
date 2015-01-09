class CreateConsultas < ActiveRecord::Migration
  def up
    create_table :consultas do |t|
    	t.integer "paciente_id"
    	t.integer "medico_id"
      t.string "motivo"
    	t.date "data"
      t.time "horario"
      t.timestamps null: false
    end
  end

  def down
  	drop_table :consultas
  end
end