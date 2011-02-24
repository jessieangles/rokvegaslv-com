class Promoter::GuestlistsController < Promoter::PromoterController

  def index
    render :action => :new
  end

  def thanks
    render :template => 'promoter/guestlists/create.html.erb'
  end

  def create
    flash[:error] = 'Please provide all required items.' if
      params[:first].blank? or params[:last].blank? or
      params[:email].blank? or params[:email_confirm].blank?

    flash[:error] = 'Email and email confirmation must match.' unless
      params[:email].eql? params[:email_confirm]
    
    unless flash[:error]
      begin
        record = {}
        [:first, :last, :phone, :email, :event, :extra_count].each {|param| record[param] = params[param]}

        record[:account] = VENUE_DRIVER[:account_id]
        record[:staff_id] = VENUE_DRIVER[:staff_id]
        
        guest = Guest.new record
        guest.save
      rescue
        flash[:error] = "Error: #{$!}" if guest.errors.count > 0
      else
        logger.warn "Guest: #{guest.inspect}"
        flash[:error] = "Guest: #{guest.errors.full_messages.join(' ')}" if
          guest.errors.count > 0
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