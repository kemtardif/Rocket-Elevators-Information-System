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

ActiveRecord::Schema.define(version: 2020_10_21_164754) do

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
    t.bigint "customer_id"
    t.bigint "building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_addresses_on_building_id"
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
  end

  create_table "batteries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "buildingType"
    t.string "batteryStatus"
    t.string "commissioningDate"
    t.string "lastInspectionDate"
    t.string "operationCertificate"
    t.string "batteryInformation"
    t.string "batteryNotes"
    t.bigint "employee_id"
    t.bigint "building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_batteries_on_building_id"
    t.index ["employee_id"], name: "index_batteries_on_employee_id"
  end

  create_table "blazer_audits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "query_id"
    t.text "statement"
    t.string "data_source"
    t.datetime "created_at"
    t.index ["query_id"], name: "index_blazer_audits_on_query_id"
    t.index ["user_id"], name: "index_blazer_audits_on_user_id"
  end

  create_table "blazer_checks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "query_id"
    t.string "state"
    t.string "schedule"
    t.text "emails"
    t.text "slack_channels"
    t.string "check_type"
    t.text "message"
    t.datetime "last_run_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_checks_on_creator_id"
    t.index ["query_id"], name: "index_blazer_checks_on_query_id"
  end

  create_table "blazer_dashboard_queries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "dashboard_id"
    t.bigint "query_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dashboard_id"], name: "index_blazer_dashboard_queries_on_dashboard_id"
    t.index ["query_id"], name: "index_blazer_dashboard_queries_on_query_id"
  end

  create_table "blazer_dashboards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_dashboards_on_creator_id"
  end

  create_table "blazer_queries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.text "description"
    t.text "statement"
    t.string "data_source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_queries_on_creator_id"
  end

  create_table "building_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_building_details_on_building_id"
  end

  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "Address"
    t.string "AdminName"
    t.string "AdminEmail"
    t.string "AdminPhone"
    t.string "TechName"
    t.string "TechEmail"
    t.string "TechPhone"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_buildings_on_customer_id"
  end

  create_table "columns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "numberOfServedFloors"
    t.string "columnType"
    t.string "columnStatus"
    t.string "columnInformation"
    t.string "columnNotes"
    t.bigint "battery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.bigint "user_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "dim_customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "customerCreationDate"
    t.string "companyName"
    t.string "companyMainContactFullName"
    t.string "companyMainContactEmail"
    t.integer "numberOfElevators"
    t.string "customerCity"
  end

  create_table "elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "elevatorSerialNumber"
    t.string "elevatorModel"
    t.string "elevatorType"
    t.string "elevatorStatus"
    t.string "elevatorDateOfComissioning"
    t.string "elevatorDateOfLastInspection"
    t.string "elevatorCertificateOfInspection"
    t.string "elevatorInformation"
    t.string "elevatorNotes"
    t.bigint "column_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "fact_contacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "contactid"
    t.string "contactCreationDate"
    t.string "contactCompanyName"
    t.string "contactEmail"
    t.string "projectName"
  end

  create_table "fact_elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "elevatorSerialNumber"
    t.string "elevatorComissioningDate"
    t.integer "buildingId"
    t.integer "customerId"
    t.string "buildingCity"
  end

  create_table "fact_quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "quoteId"
    t.string "quoteCreationDate"
    t.string "companyName"
    t.string "email"
    t.integer "numberOfElevators"
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
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
    t.bigint "customer_id"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["customer_id"], name: "index_users_on_customer_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
