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

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "typeofaddress", limit: 255
    t.string "addressstatus", limit: 255
    t.string "addressentity", limit: 255
    t.string "streetnumberandname", limit: 255
    t.bigint "suiteandapartementnumber"
    t.string "cityname", limit: 255
    t.string "postalcode", limit: 255
    t.string "countryaddress", limit: 255
    t.string "addressnotes", limit: 255
    t.decimal "customer_id"
    t.decimal "building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "idx_24988_index_addresses_on_building_id"
    t.index ["customer_id"], name: "idx_24988_index_addresses_on_customer_id"
  end

  create_table "awesome_stuffs", force: :cascade do |t|
  end

  create_table "batteries", force: :cascade do |t|
    t.string "buildingtype", limit: 255
    t.string "batterystatus", limit: 255
    t.string "commissioningdate", limit: 255
    t.string "lastinspectiondate", limit: 255
    t.string "operationcertificate", limit: 255
    t.string "batteryinformation", limit: 255
    t.string "batterynotes", limit: 255
    t.decimal "employee_id"
    t.decimal "building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "idx_25003_index_batteries_on_building_id"
    t.index ["employee_id"], name: "idx_25003_index_batteries_on_employee_id"
  end

  create_table "blazer_audits", force: :cascade do |t|
    t.decimal "user_id"
    t.decimal "query_id"
    t.text "statement"
    t.string "data_source", limit: 255
    t.datetime "created_at"
    t.index ["query_id"], name: "idx_25012_index_blazer_audits_on_query_id"
    t.index ["user_id"], name: "idx_25012_index_blazer_audits_on_user_id"
  end

  create_table "blazer_checks", force: :cascade do |t|
    t.decimal "creator_id"
    t.decimal "query_id"
    t.string "state", limit: 255
    t.string "schedule", limit: 255
    t.text "emails"
    t.text "slack_channels"
    t.string "check_type", limit: 255
    t.text "message"
    t.datetime "last_run_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "idx_25021_index_blazer_checks_on_creator_id"
    t.index ["query_id"], name: "idx_25021_index_blazer_checks_on_query_id"
  end

  create_table "blazer_dashboard_queries", force: :cascade do |t|
    t.decimal "dashboard_id"
    t.decimal "query_id"
    t.bigint "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dashboard_id"], name: "idx_25039_index_blazer_dashboard_queries_on_dashboard_id"
    t.index ["query_id"], name: "idx_25039_index_blazer_dashboard_queries_on_query_id"
  end

  create_table "blazer_dashboards", force: :cascade do |t|
    t.decimal "creator_id"
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "idx_25030_index_blazer_dashboards_on_creator_id"
  end

  create_table "blazer_queries", force: :cascade do |t|
    t.decimal "creator_id"
    t.string "name", limit: 255
    t.text "description"
    t.text "statement"
    t.string "data_source", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "idx_25048_index_blazer_queries_on_creator_id"
  end

  create_table "building_details", force: :cascade do |t|
    t.decimal "building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "idx_25066_index_building_details_on_building_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.string "address", limit: 255
    t.string "adminname", limit: 255
    t.string "adminemail", limit: 255
    t.string "adminphone", limit: 255
    t.string "techname", limit: 255
    t.string "techemail", limit: 255
    t.string "techphone", limit: 255
    t.decimal "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "idx_25057_index_buildings_on_customer_id"
  end

  create_table "columns", force: :cascade do |t|
    t.bigint "numberofservedfloors"
    t.string "columntype", limit: 255
    t.string "columnstatus", limit: 255
    t.string "columninformation", limit: 255
    t.string "columnnotes", limit: 255
    t.decimal "battery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battery_id"], name: "idx_25075_index_columns_on_battery_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "customerscreationdate", limit: 255
    t.string "companyname", limit: 255
    t.string "companyhhaddress", limit: 255
    t.string "companycontactfullname", limit: 255
    t.string "companycontactphone", limit: 255
    t.string "companycontactemail", limit: 255
    t.string "companydescription", limit: 255
    t.string "technicalauthorityfullname", limit: 255
    t.string "technicalauthorityphone", limit: 255
    t.string "technicalmanageremail", limit: 255
    t.decimal "user_id"
    t.index ["user_id"], name: "idx_25084_index_customers_on_user_id"
  end

  create_table "dim_customers", force: :cascade do |t|
    t.string "customerCreationDate"
    t.string "companyName"
    t.string "companyMainContactFullName"
    t.string "companyMainContactEmail"
    t.integer "numberOfElevators"
    t.string "customerCity"
  end

  create_table "dim_customers", force: :cascade do |t|
    t.string "customerCreationDate"
    t.string "companyName"
    t.string "companyMainContactFullName"
    t.string "companyMainContactEmail"
    t.integer "numberOfElevators"
    t.string "customerCity"
  end

  create_table "elevators", force: :cascade do |t|
    t.string "elevatorserialnumber", limit: 255
    t.string "elevatormodel", limit: 255
    t.string "elevatortype", limit: 255
    t.string "elevatorstatus", limit: 255
    t.string "elevatordateofcomissioning", limit: 255
    t.string "elevatordateoflastinspection", limit: 255
    t.string "elevatorcertificateofinspection", limit: 255
    t.string "elevatorinformation", limit: 255
    t.string "elevatornotes", limit: 255
    t.decimal "column_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["column_id"], name: "idx_25102_index_elevators_on_column_id"
  end

  create_table "employees", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "firstname", limit: 255
    t.string "lastname", limit: 255
    t.string "function", limit: 255
    t.index ["email"], name: "idx_25111_index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "idx_25111_index_employees_on_reset_password_token", unique: true
  end

  create_table "fact_contacts", force: :cascade do |t|
    t.string "contactid"
    t.string "contactCreationDate"
    t.string "contactCompanyName"
    t.string "contactEmail"
    t.string "projectName"
  end

  create_table "fact_contacts", force: :cascade do |t|
    t.string "contactid"
    t.string "contactCreationDate"
    t.string "contactCompanyName"
    t.string "contactEmail"
    t.string "projectName"
  end

  create_table "fact_elevators", force: :cascade do |t|
    t.string "elevatorSerialNumber"
    t.string "elevatorComissioningDate"
    t.integer "buildingId"
    t.integer "customerId"
    t.string "buildingCity"
  end

  create_table "fact_elevators", force: :cascade do |t|
    t.string "elevatorSerialNumber"
    t.string "elevatorComissioningDate"
    t.integer "buildingId"
    t.integer "customerId"
    t.string "buildingCity"
  end

  create_table "fact_quotes", force: :cascade do |t|
    t.integer "quoteId"
    t.string "quoteCreationDate"
    t.string "companyName"
    t.string "email"
    t.integer "numberOfElevators"
  end

  create_table "fact_quotes", force: :cascade do |t|
    t.integer "quoteId"
    t.string "quoteCreationDate"
    t.string "companyName"
    t.string "email"
    t.integer "numberOfElevators"
  end

  create_table "quotes", force: :cascade do |t|
    t.decimal "user_id"
    t.string "buildingtype", limit: 255
    t.bigint "apartmentnumbers"
    t.bigint "numberoffloors"
    t.bigint "numberofbasements"
    t.bigint "numberofstores"
    t.bigint "numbercages"
    t.bigint "parkinglevels"
    t.bigint "numberofcompanies"
    t.bigint "occupantsperfloor"
    t.bigint "estimatedcagesneeded"
    t.string "packageselection", limit: 255
    t.decimal "elevatorprice", precision: 10, scale: 2
    t.decimal "installationcost", precision: 10, scale: 2
    t.decimal "totalprice", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "idx_25149_index_quotes_on_user_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "var", limit: 255, null: false
    t.text "value"
    t.string "target_type", limit: 255, null: false
    t.bigint "target_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["target_type", "target_id", "var"], name: "idx_25161_index_settings_on_target_type_and_target_id_and_var", unique: true
    t.index ["target_type", "target_id"], name: "idx_25161_index_settings_on_target_type_and_target_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.decimal "customer_id"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", limit: 255
    t.index ["customer_id"], name: "idx_25170_index_users_on_customer_id"
    t.index ["email"], name: "idx_25170_index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "idx_25170_index_users_on_reset_password_token", unique: true
  end

end
