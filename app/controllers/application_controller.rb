class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        # Information from our db/migrate schema
        @show_sidebar = true if account_signed_in?
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :details, :url, :telephone, :cover_image])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end

    def index
        if session[:account_id]
            @accounts = Account.find(session[:account_id])
    end
end
end
