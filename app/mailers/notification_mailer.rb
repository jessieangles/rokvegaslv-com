class NotificationMailer < ActionMailer::Base
  default :from => "web-site@rokvegasnightclub.com"
  
  def contact(params)
    @params = params
    mail(:to => Configurable[:contact_email],
         :subject => "Contact form from rokvegasnightclub.com")
  end

  def plan_your_party(params)
    @params = params
    mail(:to => Configurable[:plan_your_party_email],
         :subject => "Plan Your Party form from rokvegasnightclub.com")
  end

  def corporate_events(params)
    @params = params
    mail(:to => Configurable[:corporate_events_email],
         :subject => "Corporate Events form from rokvegasnightclub.com")
  end
  
end
