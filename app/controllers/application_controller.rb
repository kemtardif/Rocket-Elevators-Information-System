class ApplicationController < ActionController::Base
    
    protect_from_forgery prepend: true, with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :firstname, :lastname, :email, :password, :current_password])
    end 
end
