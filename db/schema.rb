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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120914202533) do

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.integer  "artist_id"
    t.integer  "release_year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_url"
  end

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disks", :force => true do |t|
    t.integer  "server_id"
    t.string   "name"
    t.string   "size"
    t.string   "space_used"
    t.string   "space_available"
    t.integer  "percent_used"
    t.string   "mount_point"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", :force => true do |t|
    t.string   "imdb_id"
    t.string   "title"
    t.integer  "year"
    t.text     "description"
    t.string   "director"
    t.string   "writer"
    t.integer  "runtime"
    t.string   "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_url"
    t.string   "definition"
    t.boolean  "hd",          :default => false
    t.string   "filename"
  end

  create_table "servers", :force => true do |t|
    t.string   "hostname"
    t.string   "domain"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
    t.integer  "port"
    t.string   "username"
    t.string   "password"
    t.boolean  "is_media",   :default => false
  end

  create_table "status_data", :force => true do |t|
    t.integer  "status_id"
    t.integer  "user_count"
    t.integer  "last_minute_load"
    t.integer  "last_five_load"
    t.integer  "last_fifteen_load"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_memory"
    t.integer  "free_memory"
    t.integer  "used_memory"
  end

  create_table "statuses", :force => true do |t|
    t.integer  "server_id"
    t.boolean  "up"
    t.integer  "ports_open"
    t.string   "ports"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uptime"
    t.string   "ip"
    t.string   "ip6"
    t.string   "mac_address"
  end

  create_table "tracks", :force => true do |t|
    t.string   "title"
    t.integer  "artist_id"
    t.integer  "album_id"
    t.integer  "track_number"
    t.integer  "disk_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.boolean  "approved",        :default => false
    t.boolean  "admin",           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
