conn = PG::Connection.new( :host => "localhost", :port => 5432, :dbname => 'myapp_stats_development', :user => 'mrcbilou', :password => 'louisfelix95' )

namespace :feed_dwh do

  desc "Take some colums in tables an create fact tables for the DWH"

  task create_fact_tables: :environment do

    conn.exec('TRUNCATE factelevators;')

    Elevator.find_each do |e|
      query3 = "INSERT INTO factelevators (elevatorserialnumber, elevatorcomissioningdate, buildingid, customerid, buildingcity ) VALUES ('#{e.elevatorSerialNumber}', '#{e.elevatorDateOfComissioning}', '#{e.column.battery.building.id}', '#{e.column.battery.building.customer.id}', '#{e.column.battery.building.buildingCity}')"
      conn.exec(query3)
    end

    conn.exec('TRUNCATE factquotes')
    Quote.find_each do |q|
      query1 = "INSERT INTO factquotes (quoteid, quotecreationdate, quotecompanyname, quoteemail, quoteNbelevator ) VALUES ('#{q.id}', '#{q.quotecreationdate}', 'Company XYZ', '#{q.user.email}', '#{q.quoteNbelevator}')"
      conn.exec(query1)
    end
    
    conn.exec('TRUNCATE dimcustomers')
    Customer.find_each do |c|
      query4 = "INSERT INTO dimcustomers (customercreationdate, companyname, companymaincontactfullName, companymaincontactemail, numberOfelevators, customercity) VALUES ('#{c.customersCreationDate}', '#{c.companyName}', '#{c.companyContactFullName}', '#{c.companyContactEmail}', '#{c.buildings.batteries.column.elevator.count}', '#{c.customerCity}')"
      conn.exec(query4)
    end

    conn.exec('TRUNCATE factcontacts')
    Contact.find_each do |x|
      query2 = "INSERT INTO factcontacts (contactid, contactcreationdate, contactcompanyname, contactemail, contactprojectname ) VALUES ('#{x.id}', '#{x.contactcreationdate}', 'Company XYZ', '#{x.contactemail}', '#{x.contactprojectname}')"
      conn.exec(query2)
    end
  end
end