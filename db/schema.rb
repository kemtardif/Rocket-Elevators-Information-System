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

ActiveRecord::Schema.define(version: 2020_10_13_220957) do

<<<<<<< HEAD
  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
>>>>>>> 874529bdf563a8c488e9e82f006fab26adadc732
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
<<<<<<< HEAD
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "employeelogins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "username"
    t.string "pasword_digest"
=======
    t.string "firstname"
    t.string "lastname"
    t.string "function"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "userName"
    t.string "buildingType"
    t.integer "apartmentNumbers"
    t.integer "numberOfFloors"
    t.integer "numberOfBasements"
    t.integer "numberOfStores"
    t.integer "numberCages"
    t.integer "parkingLevels"
    t.integer "numberOfCompanies"
    t.integer "occupantsPerFloor"
    t.integer "estimatedCagesNeeded"
    t.string "packageSelection"
    t.decimal "elevatorPrice", precision: 10, scale: 2
    t.decimal "installationCost", precision: 10, scale: 2
    t.decimal "totalPrice", precision: 10, scale: 2
>>>>>>> 874529bdf563a8c488e9e82f006fab26adadc732
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "userName"
    t.string "buildingType"
    t.integer "apartmentNumbers"
    t.integer "numberOfFloors"
    t.integer "numberOfBasements"
    t.integer "numberOfStores"
    t.integer "numberCages"
    t.integer "parkingLevels"
    t.integer "numberOfCompanies"
    t.integer "occupantsPerFloor"
    t.integer "estimatedCagesNeeded"
    t.string "packageSelection"
    t.decimal "elevatorPrice", precision: 10, scale: 2
    t.decimal "installationCost", precision: 10, scale: 2
    t.decimal "totalPrice", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "userName"
    t.string "buildingType"
    t.integer "apartmentNumbers"
    t.integer "numberOfFloors"
    t.integer "numberOfBasements"
    t.integer "numberOfStores"
    t.integer "numberCages"
    t.integer "parkingLevels"
    t.integer "numberOfCompanies"
    t.integer "occupantsPerFloor"
    t.integer "estimatedCagesNeeded"
    t.string "packageSelection"
    t.decimal "elevatorPrice", precision: 10, scale: 2
    t.decimal "installationCost", precision: 10, scale: 2
    t.decimal "totalPrice", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
