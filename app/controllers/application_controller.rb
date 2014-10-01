class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	# yep
	protect_from_forgery with: :exception
	before_filter :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		@pledge_class_arr = Pending.pledge_class
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :pledge_class, :email, :password, :pledge_class_arr) }
		# devise_parameter_sanitizer.for(:account_update) {|a| a.permit(:name, :email, :email2, :street, :city, :state, :zip_code, :phone, :email, :marital_status, :major, :pledge_class, :pledge_class_name, :grad_year, :employer, :job_title, :facebook, :twitter, :instagram, :linkedin, :pinterest, :comments)}
		# end

		# def account_update_params
		# params.require(:user).permit(:name, :email, :email2, :street, :city, :state, :zip_code, :phone, :email, :marital_status, :major, :pledge_class, :pledge_class_name, :grad_year, :employer, :job_title, :facebook, :twitter, :instagram, :linkedin, :pinterest, :comments)
		# devise_parameter_sanitizer.for(:account_update) do |u|
		# 	u.permit(:name, :email, :email2, :street, :city, :state, :zip_code, :phone, :email, :marital_status, :major, :pledge_class, :pledge_class_name, :grad_year, :employer, :job_title, :facebook, :twitter, :instagram, :linkedin, :pinterest, :comments)
		# end
		# devise_parameter_sanitizer.for(:account_update) {|a| a.permit(:name, :email, :email2, :street,
		#  :city, :state, :zip_code, :phone, :email, :marital_status, :major, :pledge_class, :pledge_class_name,
		#   :grad_year, :employer, :job_title, :facebook, :twitter, :instagram, :linkedin, :pinterest, :comments)}
	end

	def after_update_path_for(resource)
	  @pledge_class_arr = Pending.pledge_class
	  user_path(resource)
	end

end
