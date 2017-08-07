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

ActiveRecord::Schema.define(version: 20170806234741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "responsible_studants", force: :cascade do |t|
    t.bigint "responsible_id"
    t.bigint "studant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["responsible_id"], name: "index_responsible_studants_on_responsible_id"
    t.index ["studant_id"], name: "index_responsible_studants_on_studant_id"
  end

  create_table "responsibles", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responsibles_studants", force: :cascade do |t|
    t.bigint "responsible_id"
    t.bigint "studant_id"
    t.index ["responsible_id"], name: "index_responsibles_studants_on_responsible_id"
    t.index ["studant_id"], name: "index_responsibles_studants_on_studant_id"
  end

  create_table "school_classes", force: :cascade do |t|
    t.bigint "teacher_id"
    t.integer "number"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_school_classes_on_teacher_id"
    t.index ["unit_id"], name: "index_school_classes_on_unit_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studants", force: :cascade do |t|
    t.string "name"
    t.date "birthday"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "school_class_id"
    t.index ["school_class_id"], name: "index_studants_on_school_class_id"
    t.index ["unit_id"], name: "index_studants_on_unit_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.date "birthday"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_teachers_on_unit_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "complement"
    t.string "name"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_units_on_school_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "school_id"
    t.index ["school_id"], name: "index_users_on_school_id"
  end

  add_foreign_key "responsible_studants", "responsibles"
  add_foreign_key "responsible_studants", "studants"
  add_foreign_key "school_classes", "teachers"
  add_foreign_key "school_classes", "units"
  add_foreign_key "studants", "units"
  add_foreign_key "teachers", "units"
end
