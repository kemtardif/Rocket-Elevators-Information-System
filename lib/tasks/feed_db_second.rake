conn = PG::Connection.new( :host => "localhost", :port => 5432, :dbname => 'db_second', :user => 'postgres', :password => 'kemtardif' )
namespace :feed_dwh do
  desc "Take some colums in tables an create fact tables for the DWH"
  task create_fact_tables: :environment do
    conn.exec('TRUNCATE "fact_elevators";')

      query1 = "INSERT INTO \"fact_elevators\" (elevatorSerialNumber, elevatorComissioningDate, buildingId, customerId, buildingCity, result, status) VALUES (101, 101, 101, 101, 101,'Succes', 'Complete')"
      conn.exec(query1)

    end
end