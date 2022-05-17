# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_17_180149) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jewel_materials", force: :cascade do |t|
    t.bigint "jewel_id", null: false
    t.bigint "material_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jewel_id"], name: "index_jewel_materials_on_jewel_id"
    t.index ["material_id"], name: "index_jewel_materials_on_material_id"
  end

  create_table "jewel_stones", force: :cascade do |t|
    t.bigint "jewel_id", null: false
    t.bigint "stone_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jewel_id"], name: "index_jewel_stones_on_jewel_id"
    t.index ["stone_id"], name: "index_jewel_stones_on_stone_id"
  end

  create_table "jewelers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jewels", force: :cascade do |t|
    t.string "name"
    t.bigint "jeweler_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jeweler_id"], name: "index_jewels_on_jeweler_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.decimal "base_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stones", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "jewel_materials", "jewels"
  add_foreign_key "jewel_materials", "materials"
  add_foreign_key "jewel_stones", "jewels"
  add_foreign_key "jewel_stones", "stones"
  add_foreign_key "jewels", "jewelers"
end
