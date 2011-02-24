class Promoter::ContactsController < Promoter::PromoterController

  def index
    render :action => :new
  end

  def thanks
    render :template => 'promoter/contacts/create.html.erb'
  end

  def create
    date_of_birth = Date.civil(params[:dob][:year].to_i, params[:dob][:month].to_i, params[:dob][:day].to_i)
    
    flash[:error] = 'Please provide all required items.' if
      params[:first].blank? or params[:last].blank? or
      params[:email].blank? or params[:email_confirm].blank? or
      params[:address_1].blank? or params[:city].blank? or params[:state].blank? or params[:zip].blank?

    flash[:error] = 'Email and email confirmation must match.' unless
      params[:email].eql? params[:email_confirm]
    
    unless flash[:error]
      begin
        record = {}
        [:first, :last, :phone, :email, :event, :gender,
         :address_1, :address_2, :city, :state, :zip].each {|param| record[param] = params[param]}

        record[:date_of_birth] = date_of_birth.to_s :db

        record[:account] = VENUE_DRIVER[:account_id]
        record[:staff_id] = VENUE_DRIVER[:staff_id]
        
        contact = Contact.new record
        contact.save
        
      rescue
        flash[:error] = "Error: #{$!}" if contact.errors.count > 0
      else
        logger.warn "Contact: #{contact.inspect}"
        flash[:error] = "Contact: #{contact.errors.full_messages.join(' ')}" if
          contact.errors.count > 0
      end
    end
    
    respond_to do |wants|
      wants.js
      wants.html do 
        if flash[:error]
          render :action => :new
        else
          render :action => :create
        end
      end
    end
  end

end