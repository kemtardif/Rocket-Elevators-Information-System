class HomeController < ApplicationController
   
    def residential
    end
    def commercial
    end
    def quote
    end
    def terms
    end

   
    
    def index
     @lead = Lead.new
    end
    
    


  end
