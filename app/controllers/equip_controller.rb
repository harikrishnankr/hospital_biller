class EquipController < ApplicationController
include UserHelper
def update_cost
   session[:cost]=params[:id]
end
def new_cost
	 nid=session[:cost]
	 #flash[:notice]="new_change=#{change}"
	 new_change=Equip.find_by_id(nid)
	 new_change.cost =params[:ncost]
	 if new_change.save
	 	flash[:notice]="successfully updated"
	 else
        flash[:notice]=new_change.errors.full_messages.to_sentence
     end
	redirect_to :back
end
def delete
	nid=Equip.find_by_id(params[:id])
	if nid.destroy
       flash[:notice]="successfully destroyed"
    else
       flash[:error]="error"
   end
	redirect_to :back
end
def reset
	current_id=Equip.find_by_id(params[:id])
	current_id.usage=0
	if current_id.save
		flash[:notice]="Successfully reset to zero"
	else
		flash[:error]="Errors while resetting"
	end
	redirect_to :back
end
end