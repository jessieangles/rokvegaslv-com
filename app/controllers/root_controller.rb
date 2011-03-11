class RootController < ApplicationController

  def contactus
    return unless request.post?
    return if missing_required_items?([:first, :last, :phone, :email, :confirm_email])
    return unless email_confirmation_match?
    NotificationMailer.contact(params).deliver
  end

  def planyourparty
    return unless request.post?
    return if missing_required_items?([:first, :last, :phone, :email, :confirm_email, :guests])
    return unless email_confirmation_match?
    NotificationMailer.plan_your_party(params).deliver
  end  

  def corporateevents
    return unless request.post?
    return if missing_required_items?([:first, :last, :company, :phone, :email, :confirm_email, :guests])
    return unless email_confirmation_match?
    NotificationMailer.corporate_events(params).deliver
  end  

  private
  
  def missing_required_items?(items)
    missing = items.select{|field| params[field].blank? }
    flash[:error] =
      "Please provide all required items.  Missing items: #{missing.join(', ')}" and return true if
        missing.size > 0
  end

  def email_confirmation_match?
    flash[:error] =
      "Email and email confirmation don't match.  Please try again." and return false unless
        params[:email] == params[:confirm_email]
    true
  end

end
