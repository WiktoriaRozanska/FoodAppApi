# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_210_926_104_542) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'days', force: :cascade do |t|
    t.string 'name'
    t.integer 'position'
    t.bigint 'week_day_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['week_day_id'], name: 'index_days_on_week_day_id'
  end

  create_table 'favorites', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'recipe_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['recipe_id'], name: 'index_favorites_on_recipe_id'
    t.index ['user_id'], name: 'index_favorites_on_user_id'
  end

  create_table 'ingredients', force: :cascade do |t|
    t.string 'name'
    t.bigint 'recipe_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['recipe_id'], name: 'index_ingredients_on_recipe_id'
  end

  create_table 'recipe_tags', force: :cascade do |t|
    t.bigint 'tag_id'
    t.bigint 'recipe_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['recipe_id'], name: 'index_recipe_tags_on_recipe_id'
    t.index ['tag_id'], name: 'index_recipe_tags_on_tag_id'
  end

  create_table 'recipes', force: :cascade do |t|
    t.string 'title'
    t.integer 'cal_per_serv'
    t.integer 'yields'
    t.integer 'total_time'
    t.string 'comment'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'recipes_in_days', force: :cascade do |t|
    t.bigint 'day_id'
    t.bigint 'recipe_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['day_id'], name: 'index_recipes_in_days_on_day_id'
    t.index ['recipe_id'], name: 'index_recipes_in_days_on_recipe_id'
  end

  create_table 'shop_lists', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'ingredient_id'
    t.boolean 'bought', default: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['ingredient_id'], name: 'index_shop_lists_on_ingredient_id'
    t.index ['user_id'], name: 'index_shop_lists_on_user_id'
  end

  create_table 'steps', force: :cascade do |t|
    t.string 'description'
    t.integer 'position'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'week_plans', force: :cascade do |t|
    t.bigint 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_week_plans_on_user_id'
  end
end
