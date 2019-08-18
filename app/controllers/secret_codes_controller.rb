class SecretCodesController < ApplicationController
  before_action :authenticate_user!
	load_and_authorize_resource

  def index
  	@secret_code = SecretCode.new
    if params[:tab].eql?"assigned"
      @secret_codes = SecretCode.assigned.includes(:user).order("created_at desc").paginate(page: params[:page], per_page: 10)
    else
      @secret_codes = SecretCode.includes(:user).order("created_at desc").paginate(page: params[:page], per_page: 10)
    end
  end

  def create
  	if params[:size].present?
  		SecretCode.generate(params[:size].to_i)
			flash[:notice] = "Successfully created..."
  	else
  		flash[:error] = "Please select a number from dropdown..."
  	end
		redirect_to secret_codes_path
  end
end
