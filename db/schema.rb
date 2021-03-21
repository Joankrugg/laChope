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

ActiveRecord::Schema.define(version: 2021_03_21_183834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "alcohol_shapes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "balances", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.float "alcohol_level"
    t.integer "color"
    t.integer "bitterness"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id"
    t.bigint "style_id"
    t.boolean "target", default: false, null: false
    t.index ["category_id"], name: "index_beers_on_category_id"
    t.index ["style_id"], name: "index_beers_on_style_id"
    t.index ["user_id"], name: "index_beers_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "design_colors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "design_feelings", force: :cascade do |t|
    t.bigint "design_id", null: false
    t.bigint "feeling_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["design_id"], name: "index_design_feelings_on_design_id"
    t.index ["feeling_id"], name: "index_design_feelings_on_feeling_id"
  end

  create_table "design_flavours", force: :cascade do |t|
    t.bigint "design_id", null: false
    t.bigint "flavour_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["design_id"], name: "index_design_flavours_on_design_id"
    t.index ["flavour_id"], name: "index_design_flavours_on_flavour_id"
  end

  create_table "designs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "alcohol_shape_id"
    t.bigint "main_taste_id"
    t.bigint "design_color_id"
    t.bigint "balance_id"
    t.bigint "category_id"
    t.index ["alcohol_shape_id"], name: "index_designs_on_alcohol_shape_id"
    t.index ["balance_id"], name: "index_designs_on_balance_id"
    t.index ["category_id"], name: "index_designs_on_category_id"
    t.index ["design_color_id"], name: "index_designs_on_design_color_id"
    t.index ["main_taste_id"], name: "index_designs_on_main_taste_id"
    t.index ["user_id"], name: "index_designs_on_user_id"
  end

  create_table "duration_units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fancies", force: :cascade do |t|
    t.boolean "heart"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "beer_id"
    t.bigint "user_id"
    t.index ["beer_id"], name: "index_fancies_on_beer_id"
    t.index ["user_id"], name: "index_fancies_on_user_id"
  end

  create_table "feelings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "flavours", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "main_tastes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "stars"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "beer_id"
    t.bigint "user_id"
    t.index ["beer_id"], name: "index_ratings_on_beer_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "step"
    t.integer "duration"
    t.integer "quantity"
    t.bigint "beer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "temperature"
    t.bigint "unit_id"
    t.bigint "action_id"
    t.bigint "duration_unit_id"
    t.string "product"
    t.bigint "product_type_id"
    t.index ["action_id"], name: "index_recipes_on_action_id"
    t.index ["beer_id"], name: "index_recipes_on_beer_id"
    t.index ["duration_unit_id"], name: "index_recipes_on_duration_unit_id"
    t.index ["product_type_id"], name: "index_recipes_on_product_type_id"
    t.index ["unit_id"], name: "index_recipes_on_unit_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_activities", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "activity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_user_activities_on_activity_id"
    t.index ["user_id"], name: "index_user_activities_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false, null: false
    t.string "username"
    t.string "website"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "articles", "users"
  add_foreign_key "beers", "categories"
  add_foreign_key "beers", "styles"
  add_foreign_key "beers", "users"
  add_foreign_key "design_feelings", "designs"
  add_foreign_key "design_feelings", "feelings"
  add_foreign_key "design_flavours", "designs"
  add_foreign_key "design_flavours", "flavours"
  add_foreign_key "designs", "alcohol_shapes"
  add_foreign_key "designs", "balances"
  add_foreign_key "designs", "categories"
  add_foreign_key "designs", "design_colors"
  add_foreign_key "designs", "main_tastes"
  add_foreign_key "designs", "users"
  add_foreign_key "fancies", "beers"
  add_foreign_key "fancies", "users"
  add_foreign_key "ratings", "beers"
  add_foreign_key "ratings", "users"
  add_foreign_key "recipes", "actions"
  add_foreign_key "recipes", "beers"
  add_foreign_key "recipes", "duration_units"
  add_foreign_key "recipes", "product_types"
  add_foreign_key "recipes", "units"
  add_foreign_key "user_activities", "activities"
  add_foreign_key "user_activities", "users"
end
