class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  
  def require_login
    redirect_to root_url, notice: "Please sign in or sign up." unless user_signed_in?
  end

  def require_admin
    redirect_to root_url, notice: "You are not authorized to view that page." unless admin?
  end


  def admin?
    user_signed_in? && current_user.try(:admin) == true
  end

  def redirect_to_under_construction
    redirect_to under_construction_url
  end

  protected
	def configure_permitted_parameters
		[ 
			:first_name, :last_name, 
			:date_of_birth, :bio, :image,
			:email
		].each do |attribute|
			devise_parameter_sanitizer.permit(:sign_up, keys: [attribute])
			# devise_parameter_sanitizer.for(:sign_up)        << attribute
		end
		# devise_parameter_sanitizer.permit(:account_update) { |u|
		#   u.permit(:password, :password_confirmation, :current_password) 
		# } 
	end
end
