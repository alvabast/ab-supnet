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

ActiveRecord::Schema.define(version: 20141108210205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.integer  "type_enum"
    t.integer  "user_id"
    t.string   "name"
    t.string   "country"
    t.string   "city"
    t.string   "street"
    t.integer  "zipcode"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_products", force: true do |t|
    t.integer  "product_id"
    t.integer  "company_id"
    t.float    "quantity"
    t.string   "quantity_unit"
    t.float    "price"
    t.string   "price_unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.integer  "product_type_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.integer  "user_id"
    t.string   "token"
    t.integer  "valid_seconds"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "login"
    t.date     "date_of_birth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
