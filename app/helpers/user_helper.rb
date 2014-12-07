module UserHelper
	def signed_in?
		!(session[:user_id].nil?)
	end
	def current_user
		if session[:user_id] 
		  User.find(session[:user_id])
		end
	end
end
