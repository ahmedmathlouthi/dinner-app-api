# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_22_193723) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "recipes", force: :cascade do |t|
    t.string "title", limit: 256, default: "", null: false
    t.string "category", limit: 256, default: "", null: false
    t.string "cuisine", limit: 256, default: "", null: false
    t.string "author", limit: 256, default: "", null: false
    t.string "image", default: "", null: false
    t.string "ingredients", default: [], array: true
    t.integer "cook_time", default: 0, null: false
    t.integer "prep_time", default: 0, null: false
    t.float "ratings", default: 0.0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredients"], name: "index_recipes_on_ingredients"
  end

end
