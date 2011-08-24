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

ActiveRecord::Schema.define(:version => 20110820173822) do

  create_table "dashboards", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "takeoff_id"
    t.integer  "wall_length"
    t.integer  "wall_height"
    t.integer  "wall_sides"
    t.integer  "floor"
    t.text     "description"
    t.integer  "wall_layers"
    t.string   "material"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "walltype_id"
  end

  create_table "materials", :force => true do |t|
    t.string   "name"
    t.integer  "spec_division"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "owner"
    t.string   "contractor"
    t.date     "bid_date"
    t.date     "start_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "takeoffs", :force => true do |t|
    t.string   "trade"
    t.string   "division"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wall_layers", :force => true do |t|
    t.integer  "walltype_id"
    t.string   "material"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "walltypes", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
