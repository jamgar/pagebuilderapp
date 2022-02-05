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

ActiveRecord::Schema.define(version: 2022_01_23_224316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "element_properties", force: :cascade do |t|
    t.bigint "element_id"
    t.string "name"
    t.string "input_type"
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["element_id"], name: "index_element_properties_on_element_id"
  end

  create_table "elements", force: :cascade do |t|
    t.string "name"
    t.string "element_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "page_elements", force: :cascade do |t|
    t.bigint "page_id", null: false
    t.bigint "element_id", null: false
    t.jsonb "properties", default: "{}", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["element_id"], name: "index_page_elements_on_element_id"
    t.index ["page_id"], name: "index_page_elements_on_page_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "page_elements", "elements"
  add_foreign_key "page_elements", "pages"
end
