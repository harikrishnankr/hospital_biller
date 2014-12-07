class PersonController < ApplicationController
 def bill
 	 @temp_person=Tempperson.find(1)
     @temp_person.update(person_params)
     if !@temp_person.save
     	#flash[:notice]="temp person saved"
     	flash[:error]="can't save"
     end
     redirect_to :back
 end
 def billcancel
		if(params[:flag])
	     
		end
		@categories=Category.all
		@equips=Equip.all
		if params[:billno]
        	@person=Person.find_by_billno(params[:billno])
        	if @person
				session[:billno]=params[:billno]
			else
	    		flash[:error]="You trying to enter #{DateTime.strptime(params[:billno],'%s')} dated bill,try something correct....!"
	    		redirect_to :back
    		end
 		end
 end
 def update_billequip
 		category=Category.find(params[:category_id])
 		@equips=category.equips.map { |e| [e.name,e.id] }.insert(0,"select an equipment")
 end
 def cost_billselect
 		@cost=Equip.find(params[:equip_id])
 end
 def cancel
 	   @person=Person.find_by_billno(session[:billno])
 	   @person.cost=@person.cost-params[:total_cost].to_i
 	   if @person.cost>=0
 	       @person.save
 	   end
       @equip=Equip.find(params[:equip_id])
       @equip.usage=@equip.usage-params[:quantity].to_i
       if @equip.usage>=0
           @equip.save
       end
       @category=Category.find(params[:category_id])
       @qty=params[:quantity].to_i
       @unit_price=params[:unit_cost]
       @total_price=params[:total_cost]

       fd=File.open("cencel.txt","a")
       fd.write("/////////////BILL NO:-")
       fd.write(session[:billno])
       fd.write("//////////////////\n")
       fd.write("***Product Canceld(Ctegory/Equipment/Qunatity/Unit Price/Total Price/Reason)***\n") 
       fd.write(Category.find(params[:category_id]).type_name)
       fd.write("\t")
       fd.write(Equip.find(params[:equip_id]).name)
       fd.write("\t")
       fd.write(params[:quantity])
       fd.write("\t")
       fd.write(params[:unit_cost])
       fd.write("\t")
       fd.write(params[:total_cost])
       fd.write("\t")
       fd.write(params[:reason])
       fd.write("\n")
 end
  private
   def person_params
    params.require(:person).permit(:name,:age,:gender,:opno,:ipno,:wardno,:address)
   end
end