# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

require_relative '../lib/populator_fix.rb'

#Populate Users

User.populate 15 do |u|
    u.username = Faker::FunnyName.name
    u.email = Faker::Internet.email
    u.encrypted_password = Faker::Internet.password
end

#POPULATE EMPLOYEES

Employee.populate 10 do |e|
    e.email = Faker::Internet.email
    e.encrypted_password = 123456
    e.firstname = Faker::Name.first_name
    e.lastname = Faker::Name.last_name  
    e.function = "Employee"
end




    

#ARRAYS WITH VARIOUS ATTRIBUTES USED tO RANDOMLY POPULATE TABLES 
typeArr = ["Shipping", "Billing", "Home", "Business"]
status = ["HQ", "Project"]
entity = ["Corporation", "Residential", "Commercial"]


#JSON USED FOR THE ADRESSES

path = File.join(File.dirname(__FILE__), "./seeds/addresses.json")
address = JSON.parse(File.read(path))

address["addresses"].map do |add|

    Address.create(
        countryAddress: "United States",
        typeOfAddress: typeArr[rand(0..3)],
        addressStatus: status[rand(0..1)],
        suiteAndApartementNumber: rand(1..101),
        addressNotes: Faker::Marketing.buzzwords,
        addressEntity: entity[rand(0..2)],
        streetNumberAndName: add["address1"],
        cityName: add["city"],
        postalCode: add["postalCode"]
    )

end

##POPULATE CUSTOMERS TABLE AS FIRST 500 users

User.find_each(finish: 5) do |u|

   cust = Customer.create!(
        customersCreationDate: Faker::Time.backward(days: 1200, period: :evening),
        companyName: Faker::Company.industry,
        companyHHAddress: Address.find(u.id).streetNumberAndName,
        user_id: u.id,
        companyContactFullName: Faker::GreekPhilosophers,
        companyContactPhone: Faker::PhoneNumber.cell_phone,
        companyContactEmail: Faker::Internet.email,
        companyDescription: Faker::Company.industry,
        technicalAuthorityFullName: Faker::FunnyName,
        technicalAuthorityPhone: Faker::PhoneNumber.cell_phone,
        technicalManagerEmail: Faker::Internet.email
        )
    u.update_attribute(:customer_id, cust.id)
    Address.find(u.id).update_attribute(:customer_id, cust.id)

end

##POPULATE BUILDINGS TABLE

Customer.find_each do |c|

  build = Building.create!(
        customer_id: c.id,
        Address:  Address.find(c.id + 6).streetNumberAndName,
        AdminName: Faker::FunnyName.name,
        AdminEmail: Faker::Internet.email,
        AdminPhone: Faker::PhoneNumber.cell_phone,
        TechName: Faker::FunnyName.name,
        TechEmail: Faker::Internet.email,
        TechPhone: Faker::PhoneNumber.cell_phone,
        
    )

    Address.find(c.id + 6).update_attribute(:building_id, build.id)

end

## POPULATE BUILDING_DETAILS TABLE

Building.find_each do |b|

    BuildingDetail.create!(
        building_id: b.id
    )

end



##POPULATE BATTERIES TABLE
buildType = ["Commercial", "Residential", "Corporate"]
status = ["Operational", "In repair", "Not Operational"]

Building.find_each do |b|

    x = Employee.find(rand(1..3)).id

   a = Battery.create!(
        building_id: b.id,
        buildingType: buildType[rand(0..2)],
        batteryStatus: status[rand(0..2)],
        employee_id: x,
        commissioningDate:Faker::Date.between(from: '2017-12-31', to: '2020-12-31'),
        lastInspectionDate:Faker::Date.between(from: '2017-12-31', to: '2020-12-31'),
        operationCertificate: Faker::Barcode.upc_e_with_composite_symbology,  
        batteryInformation: Faker::Quote.most_interesting_man_in_the_world,
        batteryNotes: Faker::ChuckNorris
    )
 
    
end

##POPULATE COLUMNS TABLE

Battery.find_each do |bat|
 
    Column.create!(
        battery_id: bat.id,
        numberOfServedFloors: rand(10..30),
        columnStatus: status[rand(0..2)],
        columnInformation: Faker::Quote.most_interesting_man_in_the_world,
        columnNotes: Faker::Quote.most_interesting_man_in_the_world
    )

end

##POPULATE ELEVATORS TABLE
model = ["Standard", "Premium", "Excelium"]
elType = ["1", "2", "3"]

Column.find_each do |col|

    Elevator.create!(
        column_id: col.id,
        elevatorSerialNumber: Faker::Barcode.ean(8), 
        elevatorModel: model[rand(0..2)],
        elevatorType: elType[rand(0..2)],
        elevatorStatus: status[rand(0..2)],
        elevatorDateOfComissioning: Faker::Date.between(from: '2017-12-31', to: '2020-12-31'),
        elevatorDateOfLastInspection: Faker::Date.between(from: '2017-12-31', to: '2020-12-31'),
        elevatorCertificateOfInspection: Faker::Barcode.upc_e_with_composite_symbology,
        elevatorInformation: Faker::Quote.most_interesting_man_in_the_world,
        elevatorNotes: Faker::Quote.most_interesting_man_in_the_world
    )

end