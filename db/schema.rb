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

ActiveRecord::Schema.define(version: 20171005021332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_groups", force: :cascade do |t|
    t.integer  "evaluation_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "user_id"
    t.boolean  "answered",             default: false
    t.integer  "evaluation_target_id"
    t.index ["evaluation_id"], name: "index_answer_groups_on_evaluation_id", using: :btree
    t.index ["evaluation_target_id"], name: "index_answer_groups_on_evaluation_target_id", using: :btree
    t.index ["user_id"], name: "index_answer_groups_on_user_id", using: :btree
  end

  create_table "answers", force: :cascade do |t|
    t.integer  "option_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "answer_group_id"
    t.integer  "question_value_id"
    t.index ["answer_group_id"], name: "index_answers_on_answer_group_id", using: :btree
    t.index ["option_id"], name: "index_answers_on_option_id", using: :btree
    t.index ["question_value_id"], name: "index_answers_on_question_value_id", using: :btree
  end

  create_table "evaluation_comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "answer_group_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["answer_group_id"], name: "index_evaluation_comments_on_answer_group_id", using: :btree
  end

  create_table "evaluation_cycles", force: :cascade do |t|
    t.datetime "initial_date"
    t.datetime "end_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "evaluation_factors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluation_models", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "sector_id"
    t.index ["sector_id"], name: "index_evaluation_models_on_sector_id", using: :btree
  end

  create_table "evaluations", force: :cascade do |t|
    t.date     "start_date"
    t.date     "finish_date"
    t.integer  "evaluation_model_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "name"
    t.integer  "evaluation_cycle_id"
    t.index ["evaluation_cycle_id"], name: "index_evaluations_on_evaluation_cycle_id", using: :btree
    t.index ["evaluation_model_id"], name: "index_evaluations_on_evaluation_model_id", using: :btree
  end

  create_table "options", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id"
    t.float    "weight"
    t.index ["question_id"], name: "index_options_on_question_id", using: :btree
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "context",    default: 0
  end

  create_table "project_allocations", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id", "user_id"], name: "index_project_allocations_on_project_id_and_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "leader_id"
    t.integer  "manager_id"
    t.index ["leader_id"], name: "index_projects_on_leader_id", using: :btree
    t.index ["manager_id"], name: "index_projects_on_manager_id", using: :btree
  end

  create_table "question_values", force: :cascade do |t|
    t.integer  "evaluation_model_id"
    t.integer  "value"
    t.integer  "question_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["evaluation_model_id"], name: "index_question_values_on_evaluation_model_id", using: :btree
    t.index ["question_id"], name: "index_question_values_on_question_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "evaluation_factor_id"
    t.index ["evaluation_factor_id"], name: "index_questions_on_evaluation_factor_id", using: :btree
  end

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_positions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "position_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["position_id"], name: "index_user_positions_on_position_id", using: :btree
    t.index ["user_id"], name: "index_user_positions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "sector_id"
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
    t.integer  "monitor_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["monitor_id"], name: "index_users_on_monitor_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["sector_id"], name: "index_users_on_sector_id", using: :btree
  end

  add_foreign_key "answer_groups", "evaluations"
  add_foreign_key "answer_groups", "users"
  add_foreign_key "answer_groups", "users", column: "evaluation_target_id"
  add_foreign_key "answers", "answer_groups"
  add_foreign_key "answers", "options"
  add_foreign_key "answers", "question_values"
  add_foreign_key "evaluation_comments", "answer_groups"
  add_foreign_key "evaluation_models", "sectors"
  add_foreign_key "evaluations", "evaluation_cycles"
  add_foreign_key "evaluations", "evaluation_models"
  add_foreign_key "options", "questions"
  add_foreign_key "projects", "users", column: "leader_id"
  add_foreign_key "projects", "users", column: "manager_id"
  add_foreign_key "question_values", "evaluation_models"
  add_foreign_key "question_values", "questions"
  add_foreign_key "user_positions", "positions"
  add_foreign_key "user_positions", "users"
  add_foreign_key "users", "sectors"
end
