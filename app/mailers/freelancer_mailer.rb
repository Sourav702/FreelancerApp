class FreelancerMailer < ActionMailer::Base
  default :from => "me@mydomain.com"

def registration_confirmation(freelancer)
  @freelancer = freelancer
  mail(:to => "#{freelancer.name} <#{freelancer.email}>", :subject => "Registration Confirmation")
end
end