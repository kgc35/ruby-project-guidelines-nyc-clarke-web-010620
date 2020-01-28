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

ActiveRecord::Schema.define(version: 20200123182008) do

  create_table "attendances", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.date    "date_of_joining_event"
  end

  create_table "events", force: :cascade do |t|
    t.string  "name_of_event"
    t.integer "number_of_attendees"
    t.text    "organizer_of_event"
    t.text    "contact_information"
    t.date    "date_of_event"
    t.time    "time_of_event"
    t.text    "link_to_calendar"
    t.text    "location"
    t.text    "link_to_maps"
    t.text    "event_description"
    t.text    "event_photo"
    t.text    "ticket_price"
    t.text    "weather_at_location"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text   "contact_information"
    t.text   "list_of_events"
    t.text   "user_type"
  end

end
