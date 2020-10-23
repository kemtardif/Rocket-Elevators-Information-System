conn = PG::Connection.new( :host => "http://codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com/", :port => 5432, :dbname => 'myapp_stats_development', :user => 'postgres', :password => 'kemtardif' )

namespace :feed_dwh do

  desc "Take some colums in tables an create fact tables for the DWH"

  task create_fact_tables: :environment do

    conn.exec('TRUNCATE factelevators;')

    Elevator.find_each do |e|
      query3 = "INSERT INTO factelevators (elevatorserialnumber, elevatorcomissioningdate, buildingid, customerid, buildingcity ) VALUES ('#{e.elevatorSerialNumber}', '#{e.elevatorDateOfComissioning}', '#{e.column.battery.building.id}', '#{e.column.battery.building.customer.id}', 'Somewhere')"
      conn.exec(query3)
    end
  
    conn.exec('TRUNCATE factquotes;')

    Quote.find_each do |q|

      query1 = "INSERT INTO factquotes (quoteid, quotecreationdate, quotecompanyname, quoteemail, quotenbelevator ) VALUES ('#{q.id}', '#{Faker::Time.between(from: 1000.days.ago, to: Time.now)}', 'Company XYZ', '#{q.user.email}', '#{q.estimatedCagesNeeded}')"
        conn.exec(query1)
      
    end

    conn.exec('TRUNCATE dimcustomers')

    Customer.find_each do |c|

      total = 0

      c.buildings.each{|b| b.batteries.each{|bat| bat.columns.each{|col| total += col.elevators.count}}}

      query4 = "INSERT INTO dimcustomers (customercreationdate, companyname, companymaincontactfullname, companymaincontactemail, numberofelevators, customercity) VALUES ('#{c.customersCreationDate}', '#{c.companyName}', '#{c.companyContactFullName}', '#{c.companyContactEmail}', '#{total}', 'Somewhere')"
      conn.exec(query4)

    end


  end
end

