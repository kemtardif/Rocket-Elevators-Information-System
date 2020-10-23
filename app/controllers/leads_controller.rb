class LeadsController < ApplicationController

    before_action :set_lead, only: [:show, :edit, :update, :destroy]
    def new
    @lead = Lead.new
    end
    def get
        @lead = Lead.new
    end
    def create
       

        @lead = Lead.new()

        @lead.ContactFullName = params['ContactName']
        @lead.CompanyName = params['CompanyName']
        @lead.Email = params['Email']
        @lead.Phone = params['Phone']
        @lead.ProjectName = params['ProjectName']
        @lead.ProjectDescription = params['Description']
        @lead.Department = params['Department']
        @lead.Message = params['Message']
        @lead.AttachedFile = params['Attachment']

        @lead.save!
    end

    def index
        @lead = Lead.all
    end 






    
end
