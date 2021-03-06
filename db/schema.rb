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

ActiveRecord::Schema.define(version: 20160521112147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artefacts", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "museum_identifier"
    t.datetime "created_at",        precision: 6, null: false
    t.datetime "updated_at",        precision: 6, null: false
    t.string   "uuid"
  end

  add_index "artefacts", ["uuid"], name: "index_artefacts_on_uuid", using: :btree

  create_table "asset_relations", force: :cascade do |t|
    t.integer  "asset_id"
    t.integer  "reconstruction_id"
    t.datetime "created_at",        precision: 6, null: false
    t.datetime "updated_at",        precision: 6, null: false
  end

  add_index "asset_relations", ["asset_id"], name: "index_asset_relations_on_asset_id", using: :btree
  add_index "asset_relations", ["reconstruction_id"], name: "index_asset_relations_on_reconstruction_id", using: :btree

  create_table "assets", force: :cascade do |t|
    t.string   "asset_type"
    t.integer  "artefact_id"
    t.datetime "created_at",                precision: 6, null: false
    t.datetime "updated_at",                precision: 6, null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at",          precision: 6
    t.string   "type"
    t.boolean  "masked"
    t.string   "masked_image_file_name"
    t.string   "masked_image_content_type"
    t.integer  "masked_image_file_size"
    t.datetime "masked_image_updated_at",   precision: 6
    t.string   "uuid"
    t.integer  "reconstruction_id"
    t.integer  "location_id"
    t.text     "metadata"
  end

  add_index "assets", ["artefact_id"], name: "index_assets_on_artefact_id", using: :btree
  add_index "assets", ["location_id"], name: "index_assets_on_location_id", using: :btree
  add_index "assets", ["reconstruction_id"], name: "index_assets_on_reconstruction_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                                    null: false
    t.integer  "sluggable_id",                            null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at",                precision: 6
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "image_matches", force: :cascade do |t|
    t.integer  "parent_image_id"
    t.integer  "comparison_image_id"
    t.integer  "matches"
    t.string   "time_to_match"
    t.binary   "has_error"
    t.datetime "created_at",          precision: 6, null: false
    t.datetime "updated_at",          precision: 6, null: false
    t.integer  "location_id"
  end

  add_index "image_matches", ["comparison_image_id"], name: "index_image_matches_on_comparison_image_id", using: :btree
  add_index "image_matches", ["location_id"], name: "index_image_matches_on_location_id", using: :btree
  add_index "image_matches", ["parent_image_id"], name: "index_image_matches_on_parent_image_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string   "slug"
    t.string   "uuid"
  end

  add_index "locations", ["uuid"], name: "index_locations_on_uuid", using: :btree

  create_table "reconstructions", force: :cascade do |t|
    t.string   "name"
    t.string   "uuid"
    t.string   "slug"
    t.text     "description"
    t.integer  "cover_image_id"
    t.datetime "created_at",     precision: 6, null: false
    t.datetime "updated_at",     precision: 6, null: false
    t.integer  "location_id"
  end

  add_index "reconstructions", ["cover_image_id"], name: "index_reconstructions_on_cover_image_id", using: :btree
  add_index "reconstructions", ["location_id"], name: "index_reconstructions_on_location_id", using: :btree
  add_index "reconstructions", ["uuid"], name: "index_reconstructions_on_uuid", using: :btree

  create_table "sketchfabs", force: :cascade do |t|
    t.integer  "artefact_id"
    t.string   "bbcode"
    t.datetime "created_at",        precision: 6, null: false
    t.datetime "updated_at",        precision: 6, null: false
    t.integer  "user_id"
    t.integer  "reconstruction_id"
  end

  add_index "sketchfabs", ["artefact_id"], name: "index_sketchfabs_on_artefact_id", using: :btree
  add_index "sketchfabs", ["reconstruction_id"], name: "index_sketchfabs_on_reconstruction_id", using: :btree
  add_index "sketchfabs", ["user_id"], name: "index_sketchfabs_on_user_id", using: :btree

  create_table "spatial_ref_sys", primary_key: "srid", force: :cascade do |t|
    t.string  "auth_name", limit: 256
    t.integer "auth_srid"
    t.string  "srtext",    limit: 2048
    t.string  "proj4text", limit: 2048
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                             default: "",    null: false
    t.string   "email",                                default: "",    null: false
    t.string   "encrypted_password",                   default: "",    null: false
    t.boolean  "admin",                                default: false, null: false
    t.boolean  "locked",                               default: false, null: false
    t.string   "slug"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at",    precision: 6
    t.integer  "sign_in_count",                        default: 0,     null: false
    t.datetime "current_sign_in_at",     precision: 6
    t.datetime "last_sign_in_at",        precision: 6
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at",           precision: 6
    t.datetime "confirmation_sent_at",   precision: 6
    t.string   "unconfirmed_email"
    t.datetime "created_at",             precision: 6
    t.datetime "updated_at",             precision: 6
    t.string   "flickr_oauth_token"
    t.string   "flickr_oauth_secret"
    t.boolean  "can_flickr",                           default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["id"], name: "index_users_on_id", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string  "foreign_key_name", null: false
    t.integer "foreign_key_id"
  end

  add_index "version_associations", ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key", using: :btree
  add_index "version_associations", ["version_id"], name: "index_version_associations_on_version_id", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",                    null: false
    t.integer  "item_id",                      null: false
    t.string   "event",                        null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at",     precision: 6
    t.text     "object_changes"
    t.integer  "transaction_id"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  add_index "versions", ["transaction_id"], name: "index_versions_on_transaction_id", using: :btree

end
