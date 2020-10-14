

class QuotesController < ApplicationController  

        before_action :set_quote, only: [:show, :edit, :update, :destroy]
       
    def new
        @quote = Quote.new
    end

    def create
      
          userName = params['userName']
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
      
          if typeOfBuilding == 'residential'
            @quote.apartmentNumbers = residentialApartmentNumbers
            @quote.numberOfFloors = residentialNumberOfFloors
            @quote.numberOfBasements = residentialNumberOfBasements
      
            @quote.estimatedCagesNeeded = estCagesNeeded
            @quote.packageSelection = packageSelection
          
            @quote.elevatorPrice = elevatorPrice
            @quote.installationCost = installationCost
            @quote.total_price = totalPrice
       
      
            @quote.save!
        
          end
      
          if typeOfBuilding == 'commercial'
            @quote.numberOfFloors = commercialNumberOfFloors
            @quote.numberOfStores = commercialNumberOfStores
            @quote.numberOfBasements = commercialNumberOfBasements
            @quote.numberCages = commercialnumberCages
            @quote.parkingLevels = commercialParkingLevels
      
            @quote.estimatedCagesNeeded = estCagesNeeded
            @quote.packageSelection = packageSelection
           
            @quote.elevatorPrice = elevatorPrice
            @quote.installationCost = installationCost
            @quote.totalPrice = totalPrice
         
      
            @quote.save!
        
          end
      
          if typeOfBuilding == 'corporate'
            @quote.companies_number = corporateCompanieNumber
            @quote.numberOfFloors = corporateNumberOfFloors
            @quote.numberOfBasements = corporateNumberOfBasements
            @quote.parkingLevels = corporateParkingLevels
            @quote.occupantsPerFloor = corporateOccupantsPerFloor
      
            @quote.estimate_cage_number = estCageNumber
            @quote.packageSelection = packageSelection
         
            @quote.elevatorPrice = elevatorPrice
            @quote.installationCost = installationCost
            @quote.totalPrice = totalPrice
            
            
            @quote.save!
          
          end
      
          if typeOfBuilding == 'hybrid'
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

    def save
        @quote.save
        respond_to do |format|
            format.html { redirect_to @quote, notice: 'Quote created' }
            format.json { render :show, status: :created, location: @quote }    
        end
    end
    
    def delete
        @quote.delete
        respond_to do |format|
           format.html { redirect_to quotes_url, notice: 'Quote deleted' }
           format.json { head :no_content }
        end
    end
        
    