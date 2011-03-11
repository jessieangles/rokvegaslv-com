class NotificationMailer < ActionMailer::Base
  default :from => "web-site@rokvegasnightclub.com"
  
  def contact(params)
    @params = params
    mail(:to => Configurable[:contact_email],
         :subject => "Contact form from rokvegasnightclub.com")
  end
  
end
