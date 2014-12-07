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

ActiveRecord::Schema.define(version: 20141206044943) do

  create_table "categories", force: true do |t|
    t.string   "type_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equips", force: true do |t|
    t.string   "serial_no"
    t.string   "name"
    t.integer  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "usage"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "gender"
    t.string   "address"
    t.string   "opno"
    t.string   "ipno"
    t.string   "wardno"
    t.string   "billno"
    t.integer  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sums", force: true do |t|
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "temppeople", force: true do |t|
    t.string   "name"
    t.string   "age"
    t.string   "gender"
    t.string   "opno"
    t.string   "ipno"
    t.string   "wardno"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "temps", force: true do |t|
    t.string   "category"
    t.string   "equip"
    t.integer  "qty"
    t.integer  "unit_price"
    t.integer  "total_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.string   "phone"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
end