class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	protect_from_forgery with: :exception
	rescue_from CanCan::AccessDenied do |exception|
		flash[:alert] = exception.message
		redirect_to root_url
	end
end
