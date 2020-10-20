# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require_relative '../lib/populator_fix.rb'

User.populate 150 do |u|
    u.username = Faker::FunnyName.name
    u.email = Faker::Internet.email
    u.encrypted_password = Faker::Internet.password
end


typeArr = ["Shipping", "Billing", "Home", "Business"]
status = ["HQ", "Project"]
entity = ["Corporation", "Residential", "Commercial"]

address = [
    {
      "address": "777 Brockton Avenue",
      "city": "Abington",
      "state": "MA",
      "zip": "2351"
    },
    {
      "address": "30 Memorial Drive",
      "city": "Avon",
      "state": "MA",
      "zip": "2322"
    },
    {
      "address": "250 Hartford Avenue",
      "city": "Bellingham",
      "state": "MA",
      "zip": "2019"
    },
    {
      "address": "700 Oak Street",
      "city": "Brockton",
      "state": "MA",
      "zip": "2301"
    },
    {
      "address": "66-4 Parkhurst Rd",
      "city": "Chelmsford",
      "state": "MA",
      "zip": "1824"
    },
    {
      "address": "591 Memorial Dr",
      "city": "Chicopee",
      "state": "MA",
      "zip": "1020"
    },
    {
      "address": "55 Brooksby Village Way",
      "city": "Danvers",
      "state": "MA",
      "zip": "1923"
    },
    {
      "address": "137 Teaticket Hwy",
      "city": "East Falmouth",
      "state": "MA",
      "zip": "2536"
    },
    {
      "address": "42 Fairhaven Commons Way",
      "city": "Fairhaven",
      "state": "MA",
      "zip": "2719"
    },
    {
      "address": "374 William S Canning Blvd",
      "city": "Fall River",
      "state": "MA",
      "zip": "2721"
    },
    {
      "address": "121 Worcester Rd",
      "city": "Framingham",
      "state": "MA",
      "zip": "1701"
    },
    {
      "address": "677 Timpany Blvd",
      "city": "Gardner",
      "state": "MA",
      "zip": "1440"
    },
    {
      "address": "337 Russell St",
      "city": "Hadley",
      "state": "MA",
      "zip": "1035"
    },
    {
      "address": "295 Plymouth Street",
      "city": "Halifax",
      "state": "MA",
      "zip": "2338"
    },
    {
      "address": "1775 Washington St",
      "city": "Hanover",
      "state": "MA",
      "zip": "2339"
    },
    {
      "address": "280 Washington Street",
      "city": "Hudson",
      "state": "MA",
      "zip": "1749"
    },
    {
      "address": "20 Soojian Dr",
      "city": "Leicester",
      "state": "MA",
      "zip": "1524"
    },
    {
      "address": "11 Jungle Road",
      "city": "Leominster",
      "state": "MA",
      "zip": "1453"
    },
    {
      "address": "301 Massachusetts Ave",
      "city": "Lunenburg",
      "state": "MA",
      "zip": "1462"
    },
    {
      "address": "780 Lynnway",
      "city": "Lynn",
      "state": "MA",
      "zip": "1905"
    },
    {
      "address": "70 Pleasant Valley Street",
      "city": "Methuen",
      "state": "MA",
      "zip": "1844"
    },
    {
      "address": "830 Curran Memorial Hwy",
      "city": "North Adams",
      "state": "MA",
      "zip": "1247"
    },
    {
      "address": "1470 S Washington St",
      "city": "North Attleboro",
      "state": "MA",
      "zip": "2760"
    },
    {
      "address": "506 State Road",
      "city": "North Dartmouth",
      "state": "MA",
      "zip": "2747"
    },
    {
      "address": "742 Main Street",
      "city": "North Oxford",
      "state": "MA",
      "zip": "1537"
    },
    {
      "address": "72 Main St",
      "city": "North Reading",
      "state": "MA",
      "zip": "1864"
    },
    {
      "address": "200 Otis Street",
      "city": "Northborough",
      "state": "MA",
      "zip": "1532"
    },
    {
      "address": "180 North King Street",
      "city": "Northhampton",
      "state": "MA",
      "zip": "1060"
    },
    {
      "address": "555 East Main St",
      "city": "Orange",
      "state": "MA",
      "zip": "1364"
    },
    {
      "address": "555 Hubbard Ave-Suite 12",
      "city": "Pittsfield",
      "state": "MA",
      "zip": "1201"
    }
]

address.each do |add|
    Address.create(
        countryAddress: "United States",
        typeOfAddress: typeArr[rand(0..3)],
        addressStatus: status[rand(0..1)],
        suiteAndApartementNumber: rand(1..101),
        addressNotes: Faker::Marketing.buzzwords,
        addressEntity: entity[rand(0..2)],

        streetNumberAndName: add[:address],
        cityName: add[:city],
        postalCode: add[:zip]
    )
end







    
