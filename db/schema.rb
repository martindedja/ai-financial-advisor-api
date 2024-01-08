# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_08_003846) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apiintegrations", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "service_name", limit: 255
    t.string "access_token", limit: 255
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chatbotlogs", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.text "query"
    t.text "response"
    t.datetime "timestamp", precision: nil
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "creditscore", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "score"
    t.date "date_updated"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "debts", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "type", limit: 255
    t.decimal "amount", precision: 10, scale: 2
    t.decimal "interest_rate", precision: 5, scale: 2
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "educationalcontent", id: :serial, force: :cascade do |t|
    t.string "topic", limit: 255
    t.text "content"
    t.integer "personalized_for"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "expenses", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "category", limit: 255
    t.decimal "amount", precision: 10, scale: 2
    t.string "frequency", limit: 255
    t.bigint "category_id"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["category_id"], name: "index_expenses_on_category_id"
  end

  create_table "income", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "source", limit: 255
    t.decimal "amount", precision: 10, scale: 2
    t.string "frequency", limit: 255
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "investments", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "type", limit: 255
    t.decimal "amount", precision: 10, scale: 2
    t.integer "risk_level"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "notifications", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "type", limit: 255
    t.text "message"
    t.datetime "date_sent", precision: nil
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "retirementaccounts", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "account_type", limit: 255
    t.decimal "balance", precision: 10, scale: 2
    t.decimal "contribution", precision: 10, scale: 2
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "taxinformation", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.decimal "taxable_income", precision: 10, scale: 2
    t.decimal "deductions", precision: 10, scale: 2
    t.decimal "credits", precision: 10, scale: 2
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "email", limit: 255
    t.string "password_hash", limit: 255
    t.integer "risk_tolerance"
    t.string "financial_goals", limit: 255
    t.string "password_digest"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  add_foreign_key "apiintegrations", "users", name: "apiintegrations_user_id_fkey"
  add_foreign_key "chatbotlogs", "users", name: "chatbotlogs_user_id_fkey"
  add_foreign_key "creditscore", "users", name: "creditscore_user_id_fkey"
  add_foreign_key "debts", "users", name: "debts_user_id_fkey"
  add_foreign_key "educationalcontent", "users", column: "personalized_for", name: "educationalcontent_personalized_for_fkey"
  add_foreign_key "expenses", "categories"
  add_foreign_key "expenses", "users", name: "expenses_user_id_fkey"
  add_foreign_key "income", "users", name: "income_user_id_fkey"
  add_foreign_key "investments", "users", name: "investments_user_id_fkey"
  add_foreign_key "notifications", "users", name: "notifications_user_id_fkey"
  add_foreign_key "retirementaccounts", "users", name: "retirementaccounts_user_id_fkey"
  add_foreign_key "taxinformation", "users", name: "taxinformation_user_id_fkey"
end
