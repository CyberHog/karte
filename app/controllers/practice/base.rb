class Practice::Base < ApplicationController
	before_action :practice_login_required

	private
	def practice_login_required
		raise Forbidden unless current_user.try(:practice?)
	end
end