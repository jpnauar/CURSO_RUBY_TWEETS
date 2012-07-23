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

ActiveRecord::Schema.define(:version => 20120710012457) do

  create_table "trends", :force => true do |t|
    t.string   "name"
    t.string   "query"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "twits", :force => true do |t|
    t.string   "id_twit"
    t.string   "text"
    t.string   "url"
    t.string   "url_text"
    t.integer  "trend_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "twits", ["id_twit"], :name => "index_twits_on_id_twit", :unique => true
  add_index "twits", ["trend_id"], :name => "index_twits_on_trend_id"
  add_index "twits", ["user_id"], :name => "index_twits_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "screen_name"
    t.string   "location"
    t.string   "description"
    t.integer  "followers_count"
    t.integer  "friends_count"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["screen_name"], :name => "index_users_on_screen_name", :unique => true

end
