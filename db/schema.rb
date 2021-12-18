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

ActiveRecord::Schema.define(version: 2021_12_12_123805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.bigint "week_day_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["week_day_id"], name: "index_days_on_week_day_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "user_id"
    t.uuid "recipe_id"
    t.index ["recipe_id"], name: "index_favorites_on_recipe_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.string "unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "recipe_id"
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "keywords", force: :cascade do |t|
    t.bigint "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "recipe_id"
    t.index ["recipe_id"], name: "index_keywords_on_recipe_id"
    t.index ["tag_id"], name: "index_keywords_on_tag_id"
  end

  create_table "recipe_tags", force: :cascade do |t|
    t.bigint "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "recipe_id"
    t.index ["recipe_id"], name: "index_recipe_tags_on_recipe_id"
    t.index ["tag_id"], name: "index_recipe_tags_on_tag_id"
  end

  create_table "recipes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.integer "cal_per_serv"
    t.integer "yields"
    t.integer "time"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "user_id"
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "recipes_in_days", force: :cascade do |t|
    t.bigint "day_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "recipe_id"
    t.index ["day_id"], name: "index_recipes_in_days_on_day_id"
    t.index ["recipe_id"], name: "index_recipes_in_days_on_recipe_id"
  end

  create_table "shop_lists", force: :cascade do |t|
    t.bigint "ingredient_id"
    t.boolean "bought", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "user_id"
    t.index ["ingredient_id"], name: "index_shop_lists_on_ingredient_id"
    t.index ["user_id"], name: "index_shop_lists_on_user_id"
  end

  create_table "steps", force: :cascade do |t|
    t.string "description"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "recipe_id"
    t.index ["recipe_id"], name: "index_steps_on_recipe_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "username"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "week_plans", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "user_id"
    t.index ["user_id"], name: "index_week_plans_on_user_id"
  end

  add_foreign_key "favorites", "recipes"
  add_foreign_key "favorites", "users"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "keywords", "recipes"
  add_foreign_key "recipe_tags", "recipes"
  add_foreign_key "recipes", "users"
  add_foreign_key "recipes_in_days", "recipes"
  add_foreign_key "shop_lists", "users"
  add_foreign_key "steps", "recipes"
  add_foreign_key "week_plans", "users"
end
