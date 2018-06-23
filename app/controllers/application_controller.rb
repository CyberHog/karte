class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      if current_user.practice?
        practice_users_path
      else
        users_path
      end
    end

  	protected
    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:business, :user_name, :last_name, :first_name, :email, :phone, :birthday, :gender, :password,
      :password_confirmation, :avatar, :avatar_cache, :remove_avatar])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:business, :user_name, :last_name, :first_name, :email, :phone, :birthday, :gender])
    devise_parameter_sanitizer.permit(:account_update, keys: [:business, :user_name, :last_name, :first_name, :phone, :birthday, :gender, :password,
      :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar])
    end

    private
    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end
end