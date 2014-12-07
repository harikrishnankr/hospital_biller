module CategoryHelper
	def current_category
		session[:new_type]
	end
end
