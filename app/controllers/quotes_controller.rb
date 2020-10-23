

class QuotesController < ApplicationController  

        before_action :set_quote, only: [:show, :edit, :update, :destroy]
        def new
          if user_signed_in?
           
            @quote = Quote.new
          else 
            redirect_to new_user_session_path, notice: 'You must be signed in to send form!'
          end
        end  
         
    def create
      
          buildingType = params['buildingType']
      
          residentialApartmentNumbers = params['esidentialApartmentNumbers']
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
      
      
          
      
          @quote = Quote.new
          
        
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
            
              @quote.save
              redirect_to new_quote_path, notice: 'Form succesfully sent!'
            

        
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
         
              @quote.save
              redirect_to new_quote_path, notice: 'Form succesfully sent!'
            
        
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
            
              @quote.save
              redirect_to new_quote_path, notice: 'Form succesfully sent!'
            
          
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
         
              @quote.save
              redirect_to new_quote_path, notice: 'Form succesfully sent!'
            

          end
          
      end  

    def index
        @quotes = Quote.all
    end  
  
end 

