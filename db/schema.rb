# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2020_09_09_141816) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
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
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.string "sender"
    t.string "location"
    t.integer "watchparty_id"
    t.integer "time"
    t.string "timestamp"
    t.string "home_team_name"
    t.string "home_team_logo"
    t.string "away_team_name"
    t.string "away_team_logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.integer "league_id"
    t.string "name"
    t.string "league_type"
    t.string "country"
    t.integer "season"
    t.string "season_start"
    t.string "season_end"
    t.string "logo"
    t.string "flag"
    t.integer "standings"
    t.integer "is_current"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer "team_id"
    t.string "name"
    t.string "logo"
    t.string "country"
    t.boolean "is_national"
    t.integer "founded"
    t.string "venue_name"
    t.string "venue_surface"
    t.string "venue_address"
    t.string "venue_city"
    t.integer "venue_capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_invitations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "invitation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invitation_id"], name: "index_user_invitations_on_invitation_id"
    t.index ["user_id"], name: "index_user_invitations_on_user_id"
  end

  create_table "user_leagues", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "league_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_user_leagues_on_league_id"
    t.index ["user_id"], name: "index_user_leagues_on_user_id"
  end

  create_table "user_watchparties", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "watchparty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_watchparties_on_user_id"
    t.index ["watchparty_id"], name: "index_user_watchparties_on_watchparty_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.string "profile_img"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "watchparties", force: :cascade do |t|
    t.string "name"
    t.string "time"
    t.integer "timestamp"
    t.string "location"
    t.string "creator_name"
    t.integer "creator_id"
    t.string "league_name"
    t.string "league_logo"
    t.string "home_team_name"
    t.string "home_team_logo"
    t.string "away_team_name"
    t.string "away_team_logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "user_invitations", "invitations"
  add_foreign_key "user_invitations", "users"
  add_foreign_key "user_leagues", "leagues"
  add_foreign_key "user_leagues", "users"
  add_foreign_key "user_watchparties", "users"
  add_foreign_key "user_watchparties", "watchparties"
end
