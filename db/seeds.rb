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

1500.times  do 

    User.create!(
        username: Faker::FunnyName.name,
        email: Faker::Internet.email,
        encrypted_password: "123456"
    )

end


    

#ARRAYS WITH VARIOUS ATTRIBUTES USED tO RANDOMLY POPULATE TABLES 
typeArr = ["Shipping", "Billing", "Home", "Business"]
status = ["Active", "Inactive"]
entity = ["Building", "Customer"]


#JSON USED FOR THE ADRESSES

path = File.join(File.dirname(__FILE__), "./seeds/addresses.json")
address = JSON.parse(File.read(path))

address["addresses"].map do |add|

    Address.create(
        countryAddress: "United States",
        typeOfAddress: typeArr[rand(0..3)],
        addressStatus: status[rand(0..1)],
        suiteAndApartementNumber: rand(1..100),
        addressNotes: Faker::Marketing.buzzwords,
        addressEntity: entity[rand(0..1)],
        streetNumberAndName: add["address1"],
        cityName: add["city"],
        postalCode: add["postalCode"]
    )

end

##POPULATE CUSTOMERS TABLE AS FIRST 500 users

User.find_each(finish: 300) do |u|

    u.customer = Customer.create!(
        customersCreationDate: Faker::Time.backward(days: 1200, period: :evening),
        companyName: Faker::Company.industry,
        companyHHAddress: Address.find(u.id).streetNumberAndName,
        companyContactFullName: Faker::GreekPhilosophers,
        companyContactPhone: Faker::PhoneNumber.cell_phone,
        companyContactEmail: Faker::Internet.email,
        companyDescription: Faker::Company.industry,
        technicalAuthorityFullName: Faker::FunnyName,
        technicalAuthorityPhone: Faker::PhoneNumber.cell_phone,
        technicalManagerEmail: Faker::Internet.email
        )
    ##u.update_attribute(:customer_id, cust.id)
    Address.find(u.id).update_attribute(:customer_id, u.customer.id)

end

##POPULATE BUILDINGS TABLE

Customer.find_each do |c|


    build = c.buildings.create!(
            Address:  Address.find(c.id + 301).streetNumberAndName,
            AdminName: Faker::FunnyName.name,
            AdminEmail: Faker::Internet.email,
            AdminPhone: Faker::PhoneNumber.cell_phone,
            TechName: Faker::FunnyName.name,
            TechEmail: Faker::Internet.email,
            TechPhone: Faker::PhoneNumber.cell_phone,
     
        )

    Address.find(c.id + 301).update_attribute(:building_id, build.id)

end

## POPULATE BUILDING_DETAILS TABLE

Building.find_each do |c|

    c.building_detail = BuildingDetail.create!(
        ##building_id: b.id
    )

end

##POPULATE EMPLOYESS

200.times do 
    Employee.create!(
    email:  Faker::Internet.email,
    encrypted_password:  "123456",
    firstname:  Faker::Name.first_name,
    lastname:  Faker::Name.last_name , 
    function:  "Employee"
    )
end


##POPULATE BATTERIES TABLE
buildType = ["Commercial", "Residential", "Corporate"]


Building.find_each do |b|


    x = Employee.find(rand(1..200)).id
    rnd = rand(1..3)
    a = buildType[rand(0..2)]

    rnd.times {

        b.batteries.create!(
            buildingType: a,
            employee_id: x,
            batteryStatus: status[rand(0..1)],
            commissioningDate:Faker::Time.backward(days: 1000, period: :evening),
            lastInspectionDate:Faker::Time.backward(days: 1000, period: :evening),
            operationCertificate: Faker::Barcode.upc_e_with_composite_symbology,  
            batteryInformation: Faker::Quote.most_interesting_man_in_the_world,
            batteryNotes: Faker::Quote.most_interesting_man_in_the_world
        )


    }
 
end

##POPULATE COLUMNS TABLE

Battery.find_each do |bat|

    rnd = rand(3..5)
    s = rand(10..30)

    rnd.times{
 
        bat.columns.create!(
            numberOfServedFloors: s,
            columnType: bat.buildingType,
            columnStatus: status[rand(0..1)],
            columnInformation: Faker::Quote.most_interesting_man_in_the_world,
            columnNotes: Faker::Quote.most_interesting_man_in_the_world
        )

    }

end

##POPULATE ELEVATORS TABLE
model = ["Standard", "Premium", "Excelium"]


Column.find_each do |col|

    rnd = rand(2..5)
    mod = model[rand(0..2)]

    rnd.times {

        col.elevators.create!(
            elevatorSerialNumber: Faker::Barcode.ean(8), 
            elevatorModel: mod,
            elevatorType: col.columnType,
            elevatorStatus: status[rand(0..1)],
            elevatorDateOfComissioning: Faker::Time.backward(days: 1000, period: :evening),
            elevatorDateOfLastInspection: Faker::Time.backward(days: 1000, period: :evening),
            elevatorCertificateOfInspection: Faker::Barcode.upc_e_with_composite_symbology,
            elevatorInformation: Faker::Quote.most_interesting_man_in_the_world,
            elevatorNotes: Faker::Quote.most_interesting_man_in_the_world
        )

    }

end
