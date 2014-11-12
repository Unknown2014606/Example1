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

ActiveRecord::Schema.define(version: 20140607112204) do

  create_table "topics", force: true do |t|
    t.string  "topic",  limit: 20
    t.integer "parent"
  end

  create_table "videos", force: true do |t|
    t.string  "title",          limit: 250
    t.string  "url",            limit: 250
    t.string  "image",          limit: 250
    t.text    "excerpt"
    t.integer "topic"
    t.text    "before_content"
    t.text    "after_content"
  end

end
