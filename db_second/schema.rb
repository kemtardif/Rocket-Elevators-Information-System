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

  create_table "awesome_stuffs", force: :cascade do |t|
  end

  create_table "dim_customers", force: :cascade do |t|
    t.string "customerCreationDate"
    t.string "companyName"
    t.string "companyMainContactFullName"
    t.string "companyMainContactEmail"
    t.integer "numberOfElevators"
    t.string "customerCity"
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

  create_table "fact_quotes", force: :cascade do |t|
    t.integer "quoteId"
    t.string "quoteCreationDate"
    t.string "companyName"
    t.string "email"
    t.integer "numberOfElevators"
  end

end
