class CategoryController < ApplicationController
   def report_yearly
   	  time=Time.now
   	  @person=Person.where("strftime('%Y',created_at)= ?",time.strftime("%Y"))
   end
   def report_monthly
   	  time=Time.now
   	  @person1=Person.where("strftime('%m',created_at)= ? and strftime('%Y',created_at)= ?",time.strftime("%m"),time.strftime("%Y"))
   	  #flash[:notice]="#{@person}"
   end
   def report_daily
   	  @person=Person.where("created_at >= ?", Time.zone.now.beginning_of_day)
   end
end
