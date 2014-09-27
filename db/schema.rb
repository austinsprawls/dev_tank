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

ActiveRecord::Schema.define(version: 20140924140227) do

  create_table "investments", force: true do |t|
    t.integer  "lender_id"
    t.integer  "loan_id"
    t.float    "amount"
    t.float    "expected_return"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lendees", force: true do |t|
    t.string   "email",                    default: "", null: false
    t.string   "encrypted_password",       default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.date     "date_of_birth"
    t.float    "yearly_individual_income"
    t.float    "yearly_additional_income"
    t.string   "credit_range"
  end

  add_index "lendees", ["email"], name: "index_lendees_on_email", unique: true
  add_index "lendees", ["reset_password_token"], name: "index_lendees_on_reset_password_token", unique: true

  create_table "lenders", force: true do |t|
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state_of_residence"
    t.float    "funds",                  default: 0.0
    t.float    "total_invested",         default: 0.0
  end

  add_index "lenders", ["email"], name: "index_lenders_on_email", unique: true
  add_index "lenders", ["reset_password_token"], name: "index_lenders_on_reset_password_token", unique: true

  create_table "loans", force: true do |t|
    t.integer  "lendee_id"
    t.float    "amount"
    t.float    "amount_funded",   default: 0.0
    t.boolean  "funded?",         default: false
    t.float    "rate"
    t.integer  "term"
    t.date     "expiration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.integer  "lender_id"
    t.integer  "lendee_id"
    t.float    "amount"
    t.float    "amount_paid", default: 0.0
    t.boolean  "paid?",       default: false
    t.date     "due_date",    default: '2014-10-27'
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
