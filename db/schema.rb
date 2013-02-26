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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130222162016) do

  create_table "barcodes", :force => true do |t|
    t.integer  "product_id"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "collanas", :force => true do |t|
    t.integer  "editore_id"
    t.string   "nome"
    t.string   "nomeFumettoOnline"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "editores", :force => true do |t|
    t.string   "nome"
    t.string   "nomeFumettoOnline"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "getdata", :force => true do |t|
    t.text     "elenco"
    t.integer  "prodotti_rilevati"
    t.string   "totale_albi"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "productcollanas", :force => true do |t|
    t.string   "numero"
    t.integer  "collana_id"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "titolo"
    t.string   "codice"
    t.string   "codiceFumettoOnline"
    t.string   "isbn"
    t.string   "copertina"
    t.integer  "prezzo"
    t.text     "descrizione"
    t.integer  "editore_id"
    t.integer  "serie_id"
    t.integer  "collana_id"
    t.boolean  "lockUpdate"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "scheda_fumettos", :force => true do |t|
    t.string   "codice"
    t.string   "copertina"
    t.string   "titolo"
    t.string   "editore"
    t.text     "serie"
    t.text     "collana"
    t.string   "isbn"
    t.string   "prezzo"
    t.string   "descrizione"
    t.text     "disegnatori"
    t.text     "sceneggiatori"
    t.text     "htmlpage"
    t.string   "urlCopertina"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

end
