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

ActiveRecord::Schema.define(version: 20170109114817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversation_users", force: :cascade do |t|
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_conversation_users_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_conversation_users_on_user_id", using: :btree
  end

  create_table "conversations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.integer  "subject_id"
    t.integer  "schedule_id"
    t.integer  "value"
    t.string   "comment"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["from_user_id"], name: "index_evaluations_on_from_user_id", using: :btree
    t.index ["schedule_id"], name: "index_evaluations_on_schedule_id", using: :btree
    t.index ["subject_id"], name: "index_evaluations_on_subject_id", using: :btree
    t.index ["to_user_id"], name: "index_evaluations_on_to_user_id", using: :btree
  end

  create_table "grade_users", force: :cascade do |t|
    t.integer "grade_id"
    t.integer "user_id"
    t.integer "relation_type", default: 0
    t.index ["grade_id"], name: "index_grade_users_on_grade_id", using: :btree
    t.index ["user_id"], name: "index_grade_users_on_user_id", using: :btree
  end

  create_table "grades", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "graduation_year"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.string   "text"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "news", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.boolean  "important",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_news_on_user_id", using: :btree
  end

  create_table "schedule_users", force: :cascade do |t|
    t.integer  "schedule_id"
    t.integer  "user_id"
    t.integer  "status",      default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "comment"
    t.index ["schedule_id"], name: "index_schedule_users_on_schedule_id", using: :btree
    t.index ["user_id"], name: "index_schedule_users_on_user_id", using: :btree
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "grade_id"
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.string   "requirements"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["grade_id"], name: "index_schedules_on_grade_id", using: :btree
    t.index ["subject_id"], name: "index_schedules_on_subject_id", using: :btree
    t.index ["user_id"], name: "index_schedules_on_user_id", using: :btree
  end

  create_table "subject_users", force: :cascade do |t|
    t.integer "subject_id"
    t.integer "user_id"
    t.integer "relation_type", default: 0
    t.index ["subject_id"], name: "index_subject_users_on_subject_id", using: :btree
    t.index ["user_id"], name: "index_subject_users_on_user_id", using: :btree
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_attributes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_attributes_on_user_id", using: :btree
  end

  create_table "user_relations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "to_user_id"
    t.integer  "relation_type", default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["to_user_id"], name: "index_user_relations_on_to_user_id", using: :btree
    t.index ["user_id"], name: "index_user_relations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "phone"
    t.integer  "role",                   default: 0
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
