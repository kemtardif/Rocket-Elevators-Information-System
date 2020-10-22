conn = PG::Connection.new( :host => "localhost", :port => 5432, :dbname => 'myapp_stats_development', :user => 'postgres', :password => 'kemtardif' )

namespace :feed_dwh do

  desc "Take some colums in tables an create fact tables for the DWH"

  task create_fact_tables: :environment do

    conn.exec('TRUNCATE factelevators;')

    Elevator.find_each do |e|
      query1 = "INSERT INTO factelevators (elevatorserialnumber, elevatorcomissioningdate, buildingid, customerid, buildingcity ) VALUES ('#{e.elevatorSerialNumber}', '#{e.elevatorDateOfComissioning}', '#{e.column.battery.building.id}', '#{e.column.battery.building.customer.id}', '#{e.column.battery.building.buildingCity}')"
      conn.exec(query1)
    end
      ##query2 = "INSERT INTO \"FactIntervention\" (employee_id, building_id, column_id, result, status) VALUES (101, #{c.battery.building_id}, #{c.id}, 'Succes', 'Complete')"
     ## conn.exec(query2)
    ##end
   ## Battery.all.take(750).each do |b|
      ##query3 = "INSERT INTO \"FactIntervention\" (employee_id, building_id, battery_id, result, status) VALUES (101, #{b.building_id}, #{b.id}, 'Succes', 'Complete')"
    ##  conn.exec(query3)
   ## end
  end
end