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

ActiveRecord::Schema.define(version: 20161121024636) do

  create_table "boxes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_boxes_on_user_id"
  end

  create_table "codes", force: :cascade do |t|
    t.integer  "box_id"
    t.string   "code"
    t.boolean  "expired",          default: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "sent_via_message"
    t.index ["box_id"], name: "index_codes_on_box_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer  "box_id"
    t.string   "name"
    t.string   "download_path"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["box_id"], name: "index_items_on_box_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string   "description"
    t.integer  "amount"
    t.string   "stripe_payment_id"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "account_name"
    t.string   "plan_type"
    t.text     "about"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "plan_expiration"
    t.string   "picture"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "user_coded_boxes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "box_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_id"], name: "index_user_coded_boxes_on_box_id"
    t.index ["user_id"], name: "index_user_coded_boxes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
