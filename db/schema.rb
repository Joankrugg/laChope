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

ActiveRecord::Schema.define(version: 2023_06_09_213401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accesses", force: :cascade do |t|
    t.string "code"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_accesses_on_user_id"
  end

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

  create_table "answers", force: :cascade do |t|
    t.string "content"
    t.string "photo"
    t.string "link"
    t.bigint "user_id", null: false
    t.bigint "publication_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["publication_id"], name: "index_answers_on_publication_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "theme_id"
    t.index ["theme_id"], name: "index_articles_on_theme_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "balances", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "beer_families", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "beer_feelings", force: :cascade do |t|
    t.bigint "beer_id", null: false
    t.bigint "feeling_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beer_id"], name: "index_beer_feelings_on_beer_id"
    t.index ["feeling_id"], name: "index_beer_feelings_on_feeling_id"
  end

  create_table "beer_flavours", force: :cascade do |t|
    t.bigint "beer_id", null: false
    t.bigint "flavour_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beer_id"], name: "index_beer_flavours_on_beer_id"
    t.index ["flavour_id"], name: "index_beer_flavours_on_flavour_id"
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
    t.boolean "spring_collection", default: false, null: false
    t.boolean "autumn_collection", default: false, null: false
    t.bigint "beer_family_id"
    t.bigint "typical_beer_id"
    t.bigint "design_color_id"
    t.bigint "alcohol_shape_id"
    t.bigint "balance_id"
    t.bigint "main_taste_id"
    t.string "page_link"
    t.index ["alcohol_shape_id"], name: "index_beers_on_alcohol_shape_id"
    t.index ["balance_id"], name: "index_beers_on_balance_id"
    t.index ["beer_family_id"], name: "index_beers_on_beer_family_id"
    t.index ["category_id"], name: "index_beers_on_category_id"
    t.index ["design_color_id"], name: "index_beers_on_design_color_id"
    t.index ["main_taste_id"], name: "index_beers_on_main_taste_id"
    t.index ["style_id"], name: "index_beers_on_style_id"
    t.index ["typical_beer_id"], name: "index_beers_on_typical_beer_id"
    t.index ["user_id"], name: "index_beers_on_user_id"
  end

  create_table "bottle_tops", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bottles", force: :cascade do |t|
    t.string "name"
    t.integer "centiliter"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contexts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "author_id"
    t.integer "receiver_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "read", default: false
    t.index ["author_id", "receiver_id"], name: "index_conversations_on_author_id_and_receiver_id", unique: true
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

  create_table "draftset_beers", force: :cascade do |t|
    t.bigint "draftset_id", null: false
    t.bigint "beer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beer_id"], name: "index_draftset_beers_on_beer_id"
    t.index ["draftset_id"], name: "index_draftset_beers_on_draftset_id"
  end

  create_table "draftsets", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_draftsets_on_store_id"
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

  create_table "favorites", force: :cascade do |t|
    t.string "favoritable_type", null: false
    t.bigint "favoritable_id", null: false
    t.string "favoritor_type", null: false
    t.bigint "favoritor_id", null: false
    t.string "scope", default: "favorite", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blocked"], name: "index_favorites_on_blocked"
    t.index ["favoritable_id", "favoritable_type"], name: "fk_favoritables"
    t.index ["favoritable_type", "favoritable_id", "favoritor_type", "favoritor_id", "scope"], name: "uniq_favorites__and_favoritables", unique: true
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable_type_and_favoritable_id"
    t.index ["favoritor_id", "favoritor_type"], name: "fk_favorites"
    t.index ["favoritor_type", "favoritor_id"], name: "index_favorites_on_favoritor_type_and_favoritor_id"
    t.index ["scope"], name: "index_favorites_on_scope"
  end

  create_table "feeds", force: :cascade do |t|
    t.string "photo"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_feeds_on_user_id"
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

  create_table "mail_alerts", force: :cascade do |t|
    t.boolean "mail_notification"
    t.bigint "personal_message_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["personal_message_id"], name: "index_mail_alerts_on_personal_message_id"
  end

  create_table "main_tastes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "market_place_beers", force: :cascade do |t|
    t.bigint "market_place_id", null: false
    t.bigint "beer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beer_id"], name: "index_market_place_beers_on_beer_id"
    t.index ["market_place_id"], name: "index_market_place_beers_on_market_place_id"
  end

  create_table "market_places", force: :cascade do |t|
    t.string "name"
    t.string "zipcode"
    t.string "city"
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.bigint "market_style_id"
    t.index ["market_style_id"], name: "index_market_places_on_market_style_id"
  end

  create_table "market_styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "newsletters", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "origins", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "packs", force: :cascade do |t|
    t.string "name"
    t.integer "bottle_numbers"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "bottle_id"
    t.index ["bottle_id"], name: "index_packs_on_bottle_id"
  end

  create_table "personal_messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "read", default: false
    t.index ["conversation_id"], name: "index_personal_messages_on_conversation_id"
    t.index ["user_id"], name: "index_personal_messages_on_user_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.bigint "pack_id", null: false
    t.bigint "typical_beer_id", null: false
    t.bigint "sticker_id", null: false
    t.bigint "bottle_top_id", null: false
    t.integer "batch"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["bottle_top_id"], name: "index_projects_on_bottle_top_id"
    t.index ["pack_id"], name: "index_projects_on_pack_id"
    t.index ["sticker_id"], name: "index_projects_on_sticker_id"
    t.index ["typical_beer_id"], name: "index_projects_on_typical_beer_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "public_search_feelings", force: :cascade do |t|
    t.bigint "feeling_id", null: false
    t.bigint "public_search_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["feeling_id"], name: "index_public_search_feelings_on_feeling_id"
    t.index ["public_search_id"], name: "index_public_search_feelings_on_public_search_id"
  end

  create_table "public_search_flavours", force: :cascade do |t|
    t.bigint "flavour_id", null: false
    t.bigint "public_search_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flavour_id"], name: "index_public_search_flavours_on_flavour_id"
    t.index ["public_search_id"], name: "index_public_search_flavours_on_public_search_id"
  end

  create_table "public_searches", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id"
    t.bigint "balance_id"
    t.bigint "alcohol_shape_id"
    t.bigint "design_color_id"
    t.bigint "main_taste_id"
    t.index ["alcohol_shape_id"], name: "index_public_searches_on_alcohol_shape_id"
    t.index ["balance_id"], name: "index_public_searches_on_balance_id"
    t.index ["category_id"], name: "index_public_searches_on_category_id"
    t.index ["design_color_id"], name: "index_public_searches_on_design_color_id"
    t.index ["main_taste_id"], name: "index_public_searches_on_main_taste_id"
  end

  create_table "publications", force: :cascade do |t|
    t.string "content"
    t.string "link"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_publications_on_user_id"
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

  create_table "sexes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stickers", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_stickers_on_user_id"
  end

  create_table "store_beers", force: :cascade do |t|
    t.bigint "beer_id", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beer_id"], name: "index_store_beers_on_beer_id"
    t.index ["store_id"], name: "index_store_beers_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "address"
    t.string "website"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "privacy_code"
    t.boolean "visitor", default: false
    t.bigint "market_place_id"
    t.index ["market_place_id"], name: "index_stores_on_market_place_id"
    t.index ["user_id"], name: "index_stores_on_user_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasting_feelings", force: :cascade do |t|
    t.bigint "tasting_id", null: false
    t.bigint "feeling_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["feeling_id"], name: "index_tasting_feelings_on_feeling_id"
    t.index ["tasting_id"], name: "index_tasting_feelings_on_tasting_id"
  end

  create_table "tasting_flavours", force: :cascade do |t|
    t.bigint "tasting_id", null: false
    t.bigint "flavour_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flavour_id"], name: "index_tasting_flavours_on_flavour_id"
    t.index ["tasting_id"], name: "index_tasting_flavours_on_tasting_id"
  end

  create_table "tasting_places", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "beer_id"
    t.bigint "market_place_id"
    t.index ["beer_id"], name: "index_tasting_places_on_beer_id"
    t.index ["market_place_id"], name: "index_tasting_places_on_market_place_id"
  end

  create_table "tastings", force: :cascade do |t|
    t.datetime "date"
    t.integer "global_rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "beer_id"
    t.bigint "user_id"
    t.bigint "balance_id"
    t.bigint "main_taste_id"
    t.bigint "design_color_id"
    t.bigint "weather_id"
    t.bigint "context_id"
    t.index ["balance_id"], name: "index_tastings_on_balance_id"
    t.index ["beer_id"], name: "index_tastings_on_beer_id"
    t.index ["context_id"], name: "index_tastings_on_context_id"
    t.index ["design_color_id"], name: "index_tastings_on_design_color_id"
    t.index ["main_taste_id"], name: "index_tastings_on_main_taste_id"
    t.index ["user_id"], name: "index_tastings_on_user_id"
    t.index ["weather_id"], name: "index_tastings_on_weather_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "typical_beer_feelings", force: :cascade do |t|
    t.bigint "typical_beer_id", null: false
    t.bigint "feeling_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["feeling_id"], name: "index_typical_beer_feelings_on_feeling_id"
    t.index ["typical_beer_id"], name: "index_typical_beer_feelings_on_typical_beer_id"
  end

  create_table "typical_beer_flavours", force: :cascade do |t|
    t.bigint "flavour_id", null: false
    t.bigint "typical_beer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flavour_id"], name: "index_typical_beer_flavours_on_flavour_id"
    t.index ["typical_beer_id"], name: "index_typical_beer_flavours_on_typical_beer_id"
  end

  create_table "typical_beers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "category_id", null: false
    t.bigint "style_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "beer_family_id"
    t.string "wiki_link"
    t.bigint "design_color_id"
    t.bigint "balance_id"
    t.bigint "alcohol_shape_id"
    t.bigint "main_taste_id"
    t.bigint "origin_id"
    t.index ["alcohol_shape_id"], name: "index_typical_beers_on_alcohol_shape_id"
    t.index ["balance_id"], name: "index_typical_beers_on_balance_id"
    t.index ["beer_family_id"], name: "index_typical_beers_on_beer_family_id"
    t.index ["category_id"], name: "index_typical_beers_on_category_id"
    t.index ["design_color_id"], name: "index_typical_beers_on_design_color_id"
    t.index ["main_taste_id"], name: "index_typical_beers_on_main_taste_id"
    t.index ["origin_id"], name: "index_typical_beers_on_origin_id"
    t.index ["style_id"], name: "index_typical_beers_on_style_id"
    t.index ["user_id"], name: "index_typical_beers_on_user_id"
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
    t.integer "age"
    t.bigint "sexe_id"
    t.string "city"
    t.string "privacy_code"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["sexe_id"], name: "index_users_on_sexe_id"
  end

  create_table "weathers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "accesses", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "publications"
  add_foreign_key "answers", "users"
  add_foreign_key "articles", "themes"
  add_foreign_key "articles", "users"
  add_foreign_key "beer_feelings", "beers"
  add_foreign_key "beer_feelings", "feelings"
  add_foreign_key "beer_flavours", "beers"
  add_foreign_key "beer_flavours", "flavours"
  add_foreign_key "beers", "alcohol_shapes"
  add_foreign_key "beers", "balances"
  add_foreign_key "beers", "beer_families"
  add_foreign_key "beers", "categories"
  add_foreign_key "beers", "design_colors"
  add_foreign_key "beers", "main_tastes"
  add_foreign_key "beers", "styles"
  add_foreign_key "beers", "typical_beers"
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
  add_foreign_key "draftset_beers", "beers"
  add_foreign_key "draftset_beers", "draftsets"
  add_foreign_key "draftsets", "stores"
  add_foreign_key "fancies", "beers"
  add_foreign_key "fancies", "users"
  add_foreign_key "feeds", "users"
  add_foreign_key "mail_alerts", "personal_messages"
  add_foreign_key "market_place_beers", "beers"
  add_foreign_key "market_place_beers", "market_places"
  add_foreign_key "market_places", "market_styles"
  add_foreign_key "packs", "bottles"
  add_foreign_key "personal_messages", "conversations"
  add_foreign_key "personal_messages", "users"
  add_foreign_key "projects", "bottle_tops"
  add_foreign_key "projects", "packs"
  add_foreign_key "projects", "stickers"
  add_foreign_key "projects", "typical_beers"
  add_foreign_key "projects", "users"
  add_foreign_key "public_search_feelings", "feelings"
  add_foreign_key "public_search_feelings", "public_searches"
  add_foreign_key "public_search_flavours", "flavours"
  add_foreign_key "public_search_flavours", "public_searches"
  add_foreign_key "public_searches", "alcohol_shapes"
  add_foreign_key "public_searches", "balances"
  add_foreign_key "public_searches", "categories"
  add_foreign_key "public_searches", "design_colors"
  add_foreign_key "public_searches", "main_tastes"
  add_foreign_key "publications", "users"
  add_foreign_key "ratings", "beers"
  add_foreign_key "ratings", "users"
  add_foreign_key "recipes", "actions"
  add_foreign_key "recipes", "beers"
  add_foreign_key "recipes", "duration_units"
  add_foreign_key "recipes", "product_types"
  add_foreign_key "recipes", "units"
  add_foreign_key "stickers", "users"
  add_foreign_key "store_beers", "beers"
  add_foreign_key "store_beers", "stores"
  add_foreign_key "stores", "market_places"
  add_foreign_key "stores", "users"
  add_foreign_key "tasting_feelings", "feelings"
  add_foreign_key "tasting_feelings", "tastings"
  add_foreign_key "tasting_flavours", "flavours"
  add_foreign_key "tasting_flavours", "tastings"
  add_foreign_key "tasting_places", "beers"
  add_foreign_key "tasting_places", "market_places"
  add_foreign_key "tastings", "balances"
  add_foreign_key "tastings", "beers"
  add_foreign_key "tastings", "contexts"
  add_foreign_key "tastings", "design_colors"
  add_foreign_key "tastings", "main_tastes"
  add_foreign_key "tastings", "users"
  add_foreign_key "tastings", "weathers"
  add_foreign_key "typical_beer_feelings", "feelings"
  add_foreign_key "typical_beer_feelings", "typical_beers"
  add_foreign_key "typical_beer_flavours", "flavours"
  add_foreign_key "typical_beer_flavours", "typical_beers"
  add_foreign_key "typical_beers", "alcohol_shapes"
  add_foreign_key "typical_beers", "balances"
  add_foreign_key "typical_beers", "beer_families"
  add_foreign_key "typical_beers", "categories"
  add_foreign_key "typical_beers", "design_colors"
  add_foreign_key "typical_beers", "main_tastes"
  add_foreign_key "typical_beers", "origins"
  add_foreign_key "typical_beers", "styles"
  add_foreign_key "typical_beers", "users"
  add_foreign_key "user_activities", "activities"
  add_foreign_key "user_activities", "users"
  add_foreign_key "users", "sexes", column: "sexe_id"
end
