class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  unless Rails.env.development?
    rescue_from Exception,                      with: :_render_500
    rescue_from ActiveRecord::RecordNotFound,   with: :_render_404
    rescue_from ActionController::RoutingError, with: :_render_404
  end

  def routing_error
    raise ActionController::RoutingError, parms[:path]
  end

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

    def _render_404(e = nill)
      logger.info "Rendering 404 with exception: #{e.message}" if e

      if request.format.to_sym == :json
        render json: { error: '404 error'}, status: :not_found
      else
        render 'errors/404', status: :not_found
      end
    end

    def _render_500(e = nill)
      logger.error "Rendering 500 with exception: #{e.message}" if e

      if request.format.to_sym == :json
        render json: { error: '500 error' }, status: :internal_server_error
      else
        render 'errors/500', status: :internal_server_error
      end
    end
end