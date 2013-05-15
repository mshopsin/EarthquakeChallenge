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

ActiveRecord::Schema.define(:version => 20130515192643) do

  create_table "earthquakes", :force => true do |t|
    t.string   "Src"
    t.string   "Eqid"
    t.string   "Version"
    t.datetime "Datetime"
    t.float    "Lat"
    t.float    "Lon"
    t.float    "Magnitude"
    t.float    "Depth"
    t.integer  "NST"
    t.string   "Region"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "earthquakes", ["Datetime"], :name => "index_earthquakes_on_Datetime"
  add_index "earthquakes", ["Eqid"], :name => "index_earthquakes_on_Eqid", :unique => true
  add_index "earthquakes", ["Lat"], :name => "index_earthquakes_on_Lat"
  add_index "earthquakes", ["Lon"], :name => "index_earthquakes_on_Lon"
  add_index "earthquakes", ["Magnitude"], :name => "index_earthquakes_on_Magnitude"

end
