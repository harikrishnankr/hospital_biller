class ReceptionnistController < ApplicationController
	def index
		if(params[:flag])
	     
		end
		@person=Person.new
	    @bill=Person.new
		@categories=Category.all
		@equips=Equip.all
		session[:billno]=nil
	end

   	def delete
        id=User.find_by_id(params[:id])
 		id.destroy
 		redirect_to :back
 	end	
 	def update_equip
 		category=Category.find(params[:category_id])
 		@equips=category.equips.map { |e| [e.name,e.id] }.insert(0,"select an equipment")
 	end
 	def show_price
        t=Tempperson.find(1)
        if t.bench=="apl"
 	       @cost=Equip.find(params[:equip_id]).cost
       elsif t.bench=="bpl"
           @cost=Equip.find(params[:equip_id]).bpl
       else
          @cost=Equip.find(params[:equip_id]).other
      end
 	end
 	def temp_add
 		@temp=Temp.new
        cat=Category.find_by_id(params[:category_id])
        @temp.category=cat.type_name
        eqp=Equip.find_by_id(params[:equip_id])
        @temp.equip=eqp.name
        @temp.qty=params[:quantity]
        @temp.unit_price=params[:unit_cost]
        @temp.total_price=params[:total_cost]
        @temp.save
        s=Sum.find(1)
        s.total=s.total+@temp.total_price
        s.save
 	end
 	def delete_item
 		del=Temp.find_by_id(params[:id])
 		s=Sum.find(1)
 		s.total=s.total-del.total_price
 		s.save
 		name=del.equip
 		obj=Equip.find_by_name(name)
 		obj.usage=obj.usage-del.qty
 		obj.save
 		del.destroy
 		#flash[:notice]="hello #{params[:temp]}"
 		redirect_to :back
 	end
 	def print
   		val=Person.where(:opno=>Tempperson.find(1).opno).last
   		#flash[:notice]="#{val.billno.to_s}"
   		path=val.billno.to_s+".txt"
   		#flash[:notice]="#{path}"
        fd=File.new(path,"w+")
        @temp=Temp.all
        fd.write("Bill No:-")
        fd.write(val.billno.to_s)
        fd.write("\nIN THE ORDER(")
        fd.write("Category 	Equipment 	Qty  Unit Cost 	Total cost)\n")
        i=0
        @temp.each do |d|
        	fd.write("(#{i+1})")
        	 i=i+1
            fd.write(d.category)
            fd.write("\t")
            fd.write(d.equip)
            fd.write("\t")
            fd.write(d.qty)
            fd.write("\t")
            fd.write(d.unit_price)
            fd.write("\t")
            fd.write(d.total_price)
            fd.write("\n")
        end
        fd.write("\n\n***********[PLEASE NOTE THIS IS A JUNK FILE DELETE AFTER USE}*********************\n")
        fd.close
   		s=Sum.find(1)
 		s.total=0
 		s.save
 		Temp.destroy_all
 		t=Tempperson.find(1)
 		t.name=""
 		t.age=""
 		t.gender=""
 		t.opno=""
 		t.ipno=""
 		t.wardno=""
 		t.address=""
 		t.save
 		redirect_to :back
 	end
 	def billno
         b=Person.new
         t=Tempperson.find(1)
        if t.name!=""&&t.age!=""&&t.gender
          	b.name=t.name
          	b.age=t.age
          	b.opno=t.opno
          	b.ipno=t.ipno
         	  b.wardno=t.wardno
         	  b.gender=t.gender
         	  b.address=t.address
         	  b.billno=params[:bill_no]
            b.bench=t.bench
         	  b.cost=Sum.find(1).total
         	  b.save
         	  @temp=Temp.all
        	  @temp.each do |t|
        		name=Equip.find_by_name(t.equip)
        		name.usage=name.usage+t.qty
        		name.save
         	end
        end
 	end
  def cancel
    Temp.destroy_all
    t=Tempperson.find(1)
    t.name=""
    t.age=""
    t.gender=""
    t.opno=""
    t.ipno=""
    t.wardno=""
    t.address=""
    t.save
    s=Sum.find(1)
    s.total=0
    s.save
    redirect_to :back
  end
end