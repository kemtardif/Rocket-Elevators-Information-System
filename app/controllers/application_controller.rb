class ApplicationController < ActionController::Base
    skip_before_filter :verify_authenticity_token, :only => :create

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :firstname, :lastname, :email, :password, :current_password])
    end 
end
