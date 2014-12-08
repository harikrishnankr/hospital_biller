class SupervisorController < ApplicationController
   include UserHelper 
   def show_receptionist
    if current_user
   	 @details=User.where(:role=>"a")
    end
   end 

   def add_equipment_type
    #flash[:notice]="name=#{params[:type_name]}"
    if current_user
       session[:new_type]=params[:type_name]
     if params[:type_name].blank?
        flash[:error]="can't be blank"
        redirect_to supervisor_index_path
     else
        redirect_to supervisor_add_equip_type_path
     end
   end
   end

   def back
   	 redirect_to supervisor_index_path
   end 

   def add_equipattr
    if current_user
     find=Category.find_by_type_name(session[:new_type])
     if !find
       @category=Category.new()
       @category.type_name=session[:new_type]
       @category.save
       find=@category
     end
       #flash[:notice]="#{find.type_name}&#{find.id}"
       if find
         @equipment=find.equips.new(equip_params)
         #@equipment.category_id=@category.id
         #flash[:notice]="#{@equipment.name}&#{find.id}"
         if @equipment.save
           flash[:notice]="successfully added #{@equipment.name}"
         else
            flash[:error]=@equipment.errors.full_messages.to_sentence
         end
       else
          flash[:error]=find.errors.full_messages.to_sentence
       end
     end
       redirect_to :back 
   end
   
   def show_equip
    if current_user
       if params[:equip_type]
         val=params[:equip_type]
         session[:e_type]=val[:type_id]
       end
       #flash[:notice]="hello #{val[:type_id]}"
       #session[:e_type]=val[:type_id]
       if session[:e_type].blank?
          flash[:error]="can't select be blank"
          redirect_to supervisor_index_path
       else
         @cat=Category.find_by_id(session[:e_type])
         @equip_total=Equip.where(:category_id =>session[:e_type])
         #redirect_to supervisor_show_select_path
       end
     end
   end
   
   def show_select
       #redirect_to supervisor_show_equipment_path
   end
   private
   def equip_params
       params.require(:equip).permit(:serial_no,:name,:cost,:bpl,:other,:usage)
   end
end