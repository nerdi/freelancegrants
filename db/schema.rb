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

ActiveRecord::Schema.define(version: 20160417223840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "interested_in"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "message"
    t.string   "poo_bear"
  end

  create_table "email_signups", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "interested_in"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "footers", force: :cascade do |t|
    t.string   "footer_title1"
    t.string   "footer_body1"
    t.string   "footer_image1_id"
    t.string   "footer_title2"
    t.string   "footer_body2"
    t.string   "footer_image2_id"
    t.string   "footer_title3"
    t.string   "footer_body3"
    t.string   "footer_image3_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "subscriber_id"
    t.integer  "category_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "featured",      default: false
    t.float    "weight"
    t.boolean  "align_right"
    t.string   "page_image_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "profile_image_id"
    t.string   "image_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "title"
    t.string   "profile_image_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "user_id"
    t.decimal  "price",             precision: 12, scale: 2
    t.boolean  "published"
    t.text     "short_description"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "purchase_items", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "purchase_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "user_id"
  end

  add_index "purchase_items", ["profile_id"], name: "index_purchase_items_on_profile_id", using: :btree
  add_index "purchase_items", ["purchase_id"], name: "index_purchase_items_on_purchase_id", using: :btree

  create_table "purchase_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.decimal  "subtotal",           precision: 12, scale: 3
    t.decimal  "tax",                precision: 12, scale: 3
    t.decimal  "shipping",           precision: 12, scale: 3
    t.decimal  "total",              precision: 12, scale: 3
    t.integer  "purchase_status_id"
    t.integer  "profile_id"
  end

  add_index "purchases", ["purchase_status_id"], name: "index_purchases_on_purchase_status_id", using: :btree
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree

  create_table "redactor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree

  create_table "sections", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "position"
    t.string   "image_id"
    t.string   "image_orientation"
    t.integer  "sectionable_id"
    t.string   "sectionable_type"
  end

  add_index "sections", ["sectionable_type", "sectionable_id"], name: "index_sections_on_sectionable_type_and_sectionable_id", using: :btree

  create_table "subscribers", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "email"
    t.string   "poo_bear"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "subscribers", ["user_id"], name: "index_subscribers_on_user_id", using: :btree

  create_table "texts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "encrypted_password"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "superadmin"
    t.string   "poo_bear"
    t.string   "reset_password_token"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "welcomes", force: :cascade do |t|
    t.string   "aboutus_title"
    t.string   "aboutus_body"
    t.string   "aboutus_image_id"
    t.string   "hero_title"
    t.string   "hero_body"
    t.string   "hero_image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bodycontent_image_id"
    t.string   "bodycontent_title"
    t.string   "bodycontent_body"
    t.string   "pricing_title"
    t.string   "pricing_body"
    t.string   "pricing_image_id"
  end

  add_foreign_key "profiles", "users"
  add_foreign_key "purchase_items", "profiles"
  add_foreign_key "purchase_items", "purchases"
  add_foreign_key "purchases", "purchase_statuses"
  add_foreign_key "purchases", "users"
end
