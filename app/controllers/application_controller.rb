class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        homes_show_path
    end

  	protected
    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:business, :user_id, :last_name, :first_name, :email, :phone, :birthday, :gender])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:business, :user_id, :last_name, :first_name, :email, :phone, :birthday, :gender])
    devise_parameter_sanitizer.permit(:account_update, keys: [:business, :user_id, :last_name, :first_name, :phone, :birthday, :gender, :image])
    end

    private
        def sign_in_required
            redirect_to new_user_session_url unless user_signed_in?
        end
end