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

ActiveRecord::Schema.define(version: 2019_10_16_220920) do

  create_table "countries", force: :cascade do |t|
    t.string "CountryCode"
    t.string "Region"
    t.string "IncomeGroup"
    t.string "SpecialNotes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gdp_pcs", force: :cascade do |t|
    t.string "CountryName"
    t.string "CountryCode"
    t.string "IndicatorName"
    t.string "IndicatorCode"
    t.decimal "Y2000"
    t.decimal "Y2001"
    t.decimal "Y2002"
    t.decimal "Y2003"
    t.decimal "Y2004"
    t.decimal "Y2005"
    t.decimal "Y2006"
    t.decimal "Y2007"
    t.decimal "Y2008"
    t.decimal "Y2009"
    t.decimal "Y2010"
    t.decimal "Y2011"
    t.decimal "Y2012"
    t.decimal "Y2013"
    t.decimal "Y2014"
    t.decimal "Y2015"
    t.decimal "Y2016"
    t.decimal "Y2017"
    t.decimal "Y2018"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "indicators", force: :cascade do |t|
    t.string "IndicatorCode"
    t.string "IndicatorName"
    t.string "SourceNote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "body"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
