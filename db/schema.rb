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

ActiveRecord::Schema.define(version: 20181211085124) do

  create_table "events", force: :cascade do |t|
    t.string   "title",                             null: false
    t.string   "short_description",                 null: false
    t.text     "long_description",                  null: false
    t.string   "location"
    t.boolean  "location_tbc",      default: true,  null: false
    t.datetime "date"
    t.boolean  "date_tbc",          default: true,  null: false
    t.boolean  "published",         default: false, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "promoter_id",                       null: false
    t.index ["promoter_id"], name: "index_events_on_promoter_id"
  end

  create_table "promoters", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_promoters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_promoters_on_reset_password_token", unique: true
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "ticket_hash"
    t.integer  "event_id"
    t.boolean  "scanned"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "first_name",  null: false
    t.string   "last_name",   null: false
    t.string   "email",       null: false
    t.index ["event_id"], name: "index_tickets_on_event_id"
    t.index ["ticket_hash"], name: "index_tickets_on_ticket_hash", unique: true
  end

end
