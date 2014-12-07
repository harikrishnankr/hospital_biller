class UserController < ApplicationController
	include UserHelper
	#index function page controller query
	def index
		if signed_in?
  		   user=User.find(session[:user_id])
  		case user.role
    	when "s"
    		redirect_to supervisor_index_path and return
    	when "a"
    	  redirect_to receptionnist_index_path and return
    	end	
  	end
	end
	#signin page controller query
	def sign_in
		 user = User.find_by_username(params[:username])
     if user && user.authenticate(params[:password])
        session[:user_id] = user.id
         flash[:notice]="hello #{user.name}"
        case user.role
        when "s"
          redirect_to supervisor_index_path and return
        when "a"
          redirect_to receptionnist_index_path and return
        end 
     else
         flash[:error]= "Invalid username or password"
         redirect_to root_url and return
     end
	end
	#sign out page query
	def sign_out
  	     session[:user_id]=nil
  	     flash[:notice]="You have been successfully logged out"
  	     redirect_to root_url
  end
  
  def creat_receptionist
     user=User.new(user_params)  
     if user.save && session[:user_id]
       flash[:notice]="successfully added #{user.name} receptionist"
     else
       flash[:error]=user.errors.full_messages.to_sentence
     end
     redirect_to supervisor_new_rec_path
  end

  def update
     updt=User.find_by_id(session[:user_id])
     if updt.update(user_params)
         flash[:notice]="successfully updated"
     else
         flash[:error]=updt.errors.full_messages.to_sentence
     end
         redirect_to supervisor_update_path
  end

  private
   def user_params
     params.require(:user).permit(:name,:username,:password,:password_confirmation,:email,:phone,:role)
   end
end
