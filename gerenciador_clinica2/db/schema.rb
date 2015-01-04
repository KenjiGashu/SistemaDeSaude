# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150104190422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "nome",                        null: false
    t.string   "email",           limit: 100, null: false
    t.string   "usuario",                     null: false
    t.string   "password_digest",             null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "consultas", force: :cascade do |t|
    t.integer  "paciente_id"
    t.integer  "medico_id"
    t.datetime "data_consulta"
    t.boolean  "confirmada"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "medicos", force: :cascade do |t|
    t.string   "nome",          null: false
    t.string   "especialidade"
    t.integer  "telefone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "pacientes", force: :cascade do |t|
    t.string   "nome",                        null: false
    t.string   "rg",                          null: false
    t.string   "email",           limit: 100, null: false
    t.string   "endereco"
    t.integer  "telefone"
    t.string   "password_digest",             null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
