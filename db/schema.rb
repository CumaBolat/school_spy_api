# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_04_20_171831) do

  create_table "parents", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "child_name"
    t.string "email"
    t.string "phone_number"
    t.string "password_digest"
    t.string "social_id"
    t.string "parent_job"
    t.integer "parent_age"
    t.integer "child_age"
    t.integer "child_grade"
    t.integer "child_school_id"
    t.integer "teacher_id"
    t.boolean "is_only_child"
    t.string "school_name"
    t.string "teacher_name"
  end

  create_table "schools", force: :cascade do |t|
    t.text "name"
    t.text "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone_number"
    t.string "password_digest"
    t.integer "age"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "school_id"
  end

end
