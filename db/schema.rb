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

ActiveRecord::Schema.define(version: 2022_08_10_102012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "attendances", force: :cascade do |t|
    t.string "present"
    t.string "absent"
    t.string "total"
    t.string "employee_id"
  end

  create_table "details", force: :cascade do |t|
    t.string "name"
    t.string "dob"
    t.string "f_name"
    t.string "m_name"
    t.string "address"
    t.string "experience"
    t.string "ph_no"
    t.string "email"
    t.integer "employee_id"
    t.index ["employee_id"], name: "index_details_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "leaves", force: :cascade do |t|
    t.string "sick", default: "5"
    t.string "privileged", default: "15"
    t.string "breavement", default: "7"
    t.string "study_leave", default: "7"
    t.string "time_off", default: "5"
    t.string "maternity", default: "84"
    t.string "paternity", default: "7"
    t.string "optional", default: "5"
    t.integer "employee_id"
    t.string "type_of_leave"
    t.date "from_date"
    t.date "to_date"
    t.string "days"
    t.string "status"
    t.index ["employee_id"], name: "index_leaves_on_employee_id"
  end

  create_table "qualifications", force: :cascade do |t|
    t.string "stream"
    t.string "yop"
    t.string "project"
    t.string "aggregate"
    t.integer "employee_id"
    t.index ["employee_id"], name: "index_qualifications_on_employee_id"
  end

  create_table "salaries", force: :cascade do |t|
    t.string "basic_pay"
    t.string "hra"
    t.string "allowance"
    t.string "deduction"
    t.string "total_salary"
    t.integer "employee_id"
    t.index ["employee_id"], name: "index_salaries_on_employee_id"
  end

end
