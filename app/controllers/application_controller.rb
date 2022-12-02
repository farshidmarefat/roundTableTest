class ApplicationController < ActionController::API
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    err_message = I18n.t "#{policy_name}.#{exception.query}", scope: 'pundit', default: :default
    render json: { message: err_message }, status: :unauthorized
  end
end
