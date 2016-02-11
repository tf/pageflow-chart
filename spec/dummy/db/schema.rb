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

ActiveRecord::Schema.define(version: 20160211085234) do

  create_table "pageflow_chart_scraped_sites", force: true do |t|
    t.string   "url"
    t.string   "state"
    t.string   "html_file_file_name"
    t.string   "html_file_content_type"
    t.integer  "html_file_file_size"
    t.datetime "html_file_updated_at"
    t.string   "javascript_file_file_name"
    t.string   "javascript_file_content_type"
    t.integer  "javascript_file_file_size"
    t.datetime "javascript_file_updated_at"
    t.string   "stylesheet_file_file_name"
    t.string   "stylesheet_file_content_type"
    t.integer  "stylesheet_file_file_size"
    t.datetime "stylesheet_file_updated_at"
    t.string   "csv_file_file_name"
    t.string   "csv_file_content_type"
    t.integer  "csv_file_file_size"
    t.datetime "csv_file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "use_custom_theme",             default: true, null: false
  end

end
