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

ActiveRecord::Schema.define(version: 2020_10_20_160749) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "typeOfAddress"
    t.string "addressStatus"
    t.string "addressEntity"
    t.string "streetNumberAndName"
    t.integer "suiteAndApartementNumber"
    t.string "cityName"
    t.string "postalCode"
    t.string "countryAddress"
    t.string "addressNotes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batteries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "buildingId"
    t.string "buildingType"
    t.string "batteryStatus"
    t.integer "employeeId"
    t.string "commissioningDate"
    t.string "lastInspectionDate"
    t.string "operationCertificate"
    t.string "batteryInformation"
    t.string "batteryNotes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_id"
    t.bigint "building_id"
    t.bigint "column_id"
    t.index ["building_id"], name: "index_batteries_on_building_id"
    t.index ["column_id"], name: "index_batteries_on_column_id"
    t.index ["employee_id"], name: "index_batteries_on_employee_id"
  end

  create_table "building_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "BuildingId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "building_id"
    t.index ["building_id"], name: "index_building_details_on_building_id"
  end

  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "CustomerId"
    t.string "Address"
    t.string "AdminName"
    t.string "AdminEmail"
    t.string "AdminPhone"
    t.string "TechName"
    t.string "TechEmail"
    t.string "TechPhone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id"
    t.bigint "building_detail_id"
    t.bigint "customer_id"
    t.bigint "battery_id"
    t.index ["address_id"], name: "index_buildings_on_address_id"
    t.index ["battery_id"], name: "index_buildings_on_battery_id"
    t.index ["building_detail_id"], name: "index_buildings_on_building_detail_id"
    t.index ["customer_id"], name: "index_buildings_on_customer_id"
  end

  create_table "columns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "batteryId"
    t.integer "numberOfServedFloors"
    t.string "columnStatus"
    t.string "columnInformation"
    t.string "columnNotes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "battery_id"
    t.index ["battery_id"], name: "index_columns_on_battery_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "customersCreationDate"
    t.string "companyName"
    t.string "companyHHAddress"
    t.string "companyContactFullName"
    t.string "companyContactPhone"
    t.string "companyContactEmail"
    t.string "companyDescription"
    t.string "technicalAuthorityFullName"
    t.string "technicalAuthorityPhone"
    t.string "technicalManagerEmail"
    t.bigint "address_id"
    t.bigint "user_id"
    t.index ["address_id"], name: "index_customers_on_address_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "columnId"
    t.string "elevatorSerialNumber"
    t.string "elevatorModel"
    t.string "elevatorType"
    t.string "elevatorStatus"
    t.string "elevatorDateOfComissioning"
    t.string "elevatorDateOfLastInspection"
    t.string "elevatorCertificateOfInspection"
    t.string "elevatorInformation"
    t.string "elevatorNotes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "column_id"
    t.index ["column_id"], name: "index_elevators_on_column_id"
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "firstname"
    t.string "lastname"
    t.string "function"
    t.bigint "battery_id"
    t.index ["battery_id"], name: "index_employees_on_battery_id"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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
    t.bigint "user_id"
    t.index ["user_id"], name: "index_quotes_on_user_id"
  end

  create_table "settings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.string "target_type", null: false
    t.integer "target_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["target_type", "target_id", "var"], name: "index_settings_on_target_type_and_target_id_and_var", unique: true
    t.index ["target_type", "target_id"], name: "index_settings_on_target_type_and_target_id"
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

  add_foreign_key "batteries", "buildings"
  add_foreign_key "batteries", "columns"
  add_foreign_key "batteries", "employees"
  add_foreign_key "building_details", "buildings"
  add_foreign_key "buildings", "addresses"
  add_foreign_key "buildings", "batteries"
  add_foreign_key "buildings", "building_details"
  add_foreign_key "buildings", "customers"
  add_foreign_key "columns", "batteries"
  add_foreign_key "customers", "addresses"
  add_foreign_key "customers", "users"
  add_foreign_key "elevators", "columns"
  add_foreign_key "employees", "batteries"
  add_foreign_key "quotes", "users"
end
