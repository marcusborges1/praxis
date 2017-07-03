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

ActiveRecord::Schema.define(version: 20170703020815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evaluation_models", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "position_id"
    t.integer  "sector_id"
    t.index ["position_id"], name: "index_evaluation_models_on_position_id", using: :btree
    t.index ["sector_id"], name: "index_evaluation_models_on_sector_id", using: :btree
  end

  create_table "evaluations", force: :cascade do |t|
    t.date     "start_date"
    t.date     "finish_date"
    t.integer  "evaluation_model_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["evaluation_model_id"], name: "index_evaluations_on_evaluation_model_id", using: :btree
  end

  create_table "options", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id"
    t.index ["question_id"], name: "index_options_on_question_id", using: :btree
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "name"
    t.string   "evaluation_factor"
    t.text     "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "evaluation_model_id"
    t.index ["evaluation_model_id"], name: "index_questions_on_evaluation_model_id", using: :btree
  end

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "sector_id"
    t.integer  "position_id"
    t.index ["position_id"], name: "index_users_on_position_id", using: :btree
    t.index ["sector_id"], name: "index_users_on_sector_id", using: :btree
  end

  add_foreign_key "evaluation_models", "positions"
  add_foreign_key "evaluation_models", "sectors"
  add_foreign_key "evaluations", "evaluation_models"
  add_foreign_key "options", "questions"
  add_foreign_key "questions", "evaluation_models"
  add_foreign_key "users", "positions"
  add_foreign_key "users", "sectors"
end
