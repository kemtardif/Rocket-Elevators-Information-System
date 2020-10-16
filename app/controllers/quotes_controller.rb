

class QuotesController < ApplicationController  

        before_action :set_quote, only: [:show, :edit, :update, :destroy]
        def new
          @quote = Quote.new
        end  
         
    def create
      
          buildingType = params['buildingType']
      
          residentialApartmentNumbers = params['ResidentialApartmentNumbers']
          residentialNumberofFloors = params['ResidentialNumberOfFloors']
          residentialNumberOfBasements = params['ResidentialNumberOfBasements']
      
          commercialNumberOfFloors = params['CommercialNumberOfFloors']
          commercialNumberOfStores = params['CommercialNumberOfStores']
          commercialNumberOfBasements = params['CommercialNumberOfBasements']
          commercialNumberCages = params['CommercialNumberCages']
          commercialParkingLevels = params['CommercialParkingLevels']
      
          corporateNumberOfCompanies = params['CorporateNumberOfCompanies']
          corporateNumberOfFloors = params['CorporateNumberOfFloors']
          corporateNumberOfBasements = params['CorporateNumberOfBasements']
          corporateParkingLevels = params['CorporateParkingLevels']
          corporateOccupantsPerFloor =params['CorporateOccupantsPerFloor']
      
          hybridNumberOfStores = params['HybridNumberOfStores']
          hybridNumberOfFloors = params['HybridNumberOfFloors']
          hybridNumberOfBasements = params['HybridNumberOfBasements']
          hybridParkingLevels = params['HybridParkingLevels']
          hybridOccupantsPerFloor = params['HybridOccupantsPerFloor']
          
      
          estCagesNeeded = params['estimatedCagesNeeded']
          packageSelection = params['packageSelection']
   
          elevatorPrice = params['elevatorPrice']
          installationCost =params['installationCost']
          totalPrice = params['totalPrice']
      
      
          
      
          @quote = Quote.new(quote_params)
          
          @quote.userName = userName
          @quote.buildingType = buildingType
      
          if buildingType == 'residential'
            @quote.apartmentNumbers = residentialApartmentNumbers
            @quote.numberOfFloors = residentialNumberofFloors
            @quote.numberOfBasements = residentialNumberOfBasements
      
            @quote.estimatedCagesNeeded = estCagesNeeded
            @quote.packageSelection = packageSelection
          
            @quote.elevatorPrice = elevatorPrice
            @quote.installationCost = installationCost
            @quote.totalPrice = totalPrice
       
      
            @quote.save!
        
          end
      
          if buildingType == 'commercial'
            @quote.numberOfFloors = commercialNumberOfFloors
            @quote.numberOfStores = commercialNumberOfStores
            @quote.numberOfBasements = commercialNumberOfBasements
            @quote.numberCages = commercialNumberCages
            @quote.parkingLevels = commercialParkingLevels
      
            @quote.estimatedCagesNeeded = estCagesNeeded
            @quote.packageSelection = packageSelection
           
            @quote.elevatorPrice = elevatorPrice
            @quote.installationCost = installationCost
            @quote.totalPrice = totalPrice
         
      
            @quote.save!
        
          end
      
          if buildingType == 'corporate'
            @quote.numberOfCompanies = corporateNumberOfCompanies
            @quote.numberOfFloors = corporateNumberOfFloors
            @quote.numberOfBasements = corporateNumberOfBasements
            @quote.parkingLevels = corporateParkingLevels
            @quote.occupantsPerFloor = corporateOccupantsPerFloor
      
            @quote.estimatedCagesNeeded = estCagesNeeded
            @quote.packageSelection = packageSelection
         
            @quote.elevatorPrice = elevatorPrice
            @quote.installationCost = installationCost
            @quote.totalPrice = totalPrice
            
            
            @quote.save!
          
          end
      
          if buildingType == 'hybrid'
            @quote.numberOfStores = hybridNumberOfStores
            @quote.numberOfFloors = hybridNumberOfFloors
            @quote.numberOfBasements = hybridNumberOfBasements
            @quote.parkingLevels = hybridParkingLevels
            @quote.occupantsPerFloor = hybridOccupantsPerFloor
        
      
            @quote.estimatedCagesNeeded = estCagesNeeded
            @quote.packageSelection = packageSelection
        
            @quote.elevatorPrice = elevatorPrice
            @quote.installationCost = installationCost
            @quote.totalPrice = totalPrice
         
      
            @quote.save!

          end
      
          if typeOfBuilding == nil
            redirect_to quote_new_path
          end
      end  

    def index
        @quote = Quote.all
    end  
    
end 

